import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const PAGE_TITLE = 'Bidhaa mpya';
const _submitText = 'WASILISHA';
const _titleLabelText = 'Jina la bidhaa';
const _descriptionLabelText = 'Maelezo kuhusiana na bidhaa';
const _priceLabelText = 'Bei ya bidhaa';
const _locationLabelText = 'Mahala bidhaa inapopatikana';
const _vendorLabelText = 'Muuzaji';
const _contactInfoLabelText = 'Mawasiliano';
const _iamgeLabelText = 'Picha za bidhaa';
const _emptyFieldsWarningText =
    'Tafadhali jaza taarifa zote za msingi zinahitajika ili kuwasilisha makala mpya.';
const _okText = 'Sawa';

class NewProductDialog extends StatefulWidget {
  @override
  _NewProductDialogState createState() => _NewProductDialogState();
}

class _NewProductDialogState extends State<NewProductDialog> {
  @override
  Widget build(BuildContext context) {
    var _titleController = new TextEditingController();
    var _descriptionController = new TextEditingController();
    var _priceFieldController = new TextEditingController();
    var _locationFieldController = new TextEditingController();
    var _imageUrlController = new TextEditingController();

    File _image;

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);

      setState(() {
        _image = image;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: new Text(PAGE_TITLE),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => _submitNewArticle(
                context, _titleController, _descriptionController),
            child: new Text(
              _submitText,
              style: new TextStyle(fontSize: 16.0),
            ),
            textTheme: ButtonTextTheme.normal,
            colorBrightness: Brightness.dark,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: new InputDecoration(
                  labelText: _titleLabelText,
                  labelStyle: new TextStyle(fontSize: 24.0)),
              autofocus: false,
              maxLines: null,
            ),
          ),
          _buildField(_descriptionController, _descriptionLabelText),
          _buildField(_priceFieldController, _priceLabelText),
          _buildField(_locationFieldController, _locationLabelText),
          _buildField(_imageUrlController, _vendorLabelText),
          new Center(
            child: _image == null ? new Container() : new Image.file(_image),
          ),
          new ButtonBar(
            children: <Widget>[
              MaterialButton(
                colorBrightness: Brightness.dark,
                color: Colors.green,
                onPressed: () => getImage(),
                child: new Text(_iamgeLabelText),
              ),
              MaterialButton(
                colorBrightness: Brightness.dark,
                color: Colors.green,
                onPressed: () => _showContactDialog(),
                child: new Text(_contactInfoLabelText),
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding _buildField(
      TextEditingController _descriptionController, String labelText) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: TextField(
        controller: _descriptionController,
        decoration: new InputDecoration(
            labelText: labelText, labelStyle: new TextStyle(fontSize: 18.0)),
        autofocus: false,
        maxLines: null,
      ),
    );
  }

  void _submitNewArticle(
      BuildContext context,
      TextEditingController titleController,
      TextEditingController descriptionController) {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      _showFieldsEmptyDialog(context);
    } else {
      Navigator.pop(context);
    }
  }

  void _showFieldsEmptyDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            content: new Text(_emptyFieldsWarningText),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: new Text(_okText))
            ],
          );
        });
  }

  _showContactDialog() {}

  _pickImage() {}
}
