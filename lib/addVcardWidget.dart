import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'modell.dart';
import 'dart:convert';

class AddVcardWidget extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  @override
  _AddVcardWidgetState createState() => _AddVcardWidgetState();
}

class _AddVcardWidgetState extends State<AddVcardWidget> {
  Box<VCardBox> box;
  Widget _buildDivider() => const SizedBox(height: 25);
  TextEditingController _controller;


  void onFormSubmit() {
    if (widget.formKey.currentState.validate()) {

      Navigator.of(context).pop();
    }
  }




  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('neuer Kontakt'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Form(
          key: widget.formKey,
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              const SizedBox(height: 5),

              _buildDivider(),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _controller,
                  autocorrect: false,
                  autovalidate: true,
                  //initialValue: 'Vcard',
                  minLines: 5,
                  maxLines: 10,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    //labelText: 'neuer Konatkt',
                    hintText: 'BEGIN:VCARD\nVERSION:3.0\nFN:Kontakt Name\nEND:VCARD',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    try {

                    } catch (e) {
                      return (e.toString());
                    }

                    if (value.isEmpty) {
                      return 'Kontakt im vcard-Format';
                    }
                    return null;
                  },
                  onFieldSubmitted: (val) {
                    // hier action
                  },
                ),
              ),

              const SizedBox(height: 50),
              Center(
                child: Row(
                  children: [
                    FlatButton(
                      child: Text('Cancel', style: TextStyle(fontSize: 20.0)),
                      color: Colors.red,
                      onPressed: Navigator.of(context).pop,
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: FlatButton(
                        child: Text('Submit', style: TextStyle(fontSize: 20.0)),
                        color: Colors.green,
                        onPressed: onFormSubmit,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
