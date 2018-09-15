import 'package:flutter/material.dart';

const PAGE_TITLE = 'Makala mpya';
const _submitText = 'WASILISHA';
const _titleLabelText = 'Kichwa cha makala';
const _descriptionLabelText = 'Maelezo ya ziada';
const _sourceUrlLabelText = 'Link ya makala';
const _videoUrlLabelText = 'Link ya video';
const _imageUrlLabelText = 'Link ya picha';
const _extraInfoText = 'Taarifa za ziada';
const _emptyFieldsWarningText =
    'Tafadhali jaza taarifa zote za msingi zinahitajika ili kuwasilisha makala mpya.';
const _okText = 'Sawa';

class NewArticleDialog extends StatefulWidget {
  @override
  _NewArticleDialogState createState() => _NewArticleDialogState();
}

class _NewArticleDialogState extends State<NewArticleDialog> {
  @override
  Widget build(BuildContext context) {
    var _titleController = new TextEditingController();
    var _descriptionController = new TextEditingController();
    var _sourceUrlController = new TextEditingController();
    var _videoUrlController = new TextEditingController();
    var _imageUrlController = new TextEditingController();

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
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 8.0),
            child: new Text(
              _extraInfoText,
              style: new TextStyle(fontSize: 20.0),
            ),
          ),
          _buildField(_sourceUrlController, _sourceUrlLabelText),
          _buildField(_imageUrlController, _imageUrlLabelText),
          _buildField(_videoUrlController, _videoUrlLabelText),
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
}
