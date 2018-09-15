import 'package:flutter/material.dart';

const PAGE_TITLE = 'Maada mpya';
const tag = 'NewForumThreadDialog';
const _contactExpertText = 'Wasiliana na mtaalamu';
const _emptyFieldsWarningText =
    'Tafadhali jaza taarifa zote zinahitajika ili kuwasilisha maada mpya.';
const _okText = 'Sawa';

class NewForumThreadDialog extends StatefulWidget {
  @override
  _CreateForumThreadDialogState createState() =>
      _CreateForumThreadDialogState();
}

class _CreateForumThreadDialogState extends State<NewForumThreadDialog> {
  @override
  Widget build(BuildContext context) {
    var _titleController = new TextEditingController();
    var _descriptionController = new TextEditingController();
    bool _contactExpert = true;

    return Scaffold(
      appBar: AppBar(
        title: new Text(PAGE_TITLE),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => _submitNewThread(
                context, _titleController, _descriptionController),
            child: new Text(
              'WASILISHA',
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
                  labelText: 'Kichwa cha maada',
                  labelStyle: new TextStyle(fontSize: 24.0)),
              autofocus: false,
              maxLines: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descriptionController,
              decoration: new InputDecoration(
                  labelText: 'Maelezo zaidi',
                  labelStyle: new TextStyle(fontSize: 18.0)),
              autofocus: false,
              maxLines: null,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _contactExpert ? _contactExpert = false : _contactExpert = true;
              });
            },
            child: Row(
              children: <Widget>[
                new Checkbox(
                  onChanged: (bool value) {
                    setState(() {
                      _contactExpert = value;
                      print('$tag value is $value');
                    });
                  },
                  value: _contactExpert,
                ),
                new Text(_contactExpertText)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(TextEditingController _titleController, String hint) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _titleController,
        decoration: new InputDecoration(
            labelText: hint,
            labelStyle:
                new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        autofocus: false,
        maxLines: null,
      ),
    );
  }

  void _submitNewThread(
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
