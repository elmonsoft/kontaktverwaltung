import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:kontaktverwaltung/vcard_object.dart';
import 'vcfToObject.dart';



class AddVcardWidget extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  @override
  _AddVcardWidgetState createState() => _AddVcardWidgetState();
}

class _AddVcardWidgetState extends State<AddVcardWidget> {
  List<VcardObject> livco = [];
  final _storage = FlutterSecureStorage();
  Widget _buildDivider() => const SizedBox(height: 25);
  TextEditingController _controller;


  void onFormSubmit() {
    if (_controller.text.length > 0){
      VcfToObject vcf = VcfToObject(_controller.text);
      _addNewItem(vcf);
      Navigator.of(context).pop();
    }
  }

  Future<Null> _readAll() async {
    Map<String, String> all = await _storage.readAll();
    VcardObject vco;
    print('readAll -> ${all.length} ');

    setState(() {
      all.forEach((key, value) => livco.add(VcardObject.fromJson(value)));
    });
  }

  void _deleteAll() async {
    await _storage.deleteAll();
    _readAll();
  }

  void _addNewItem(VcfToObject vcf) async {
    print('new MD5 -> ${vcf.getMD5()}');
    await _storage.write(key: vcf.getMD5(), value: jsonEncode(vcf.vco.toMap()));
    _readAll();
  }


  @override
  void initState() {
    super.initState();
    _readAll();
    String sample_vcard = '''BEGIN:VCARD
VERSION:3.0
FN:Kontakt 1
N:;;;;
NICKNAME:contact_1_nickname
GENDER:O
TITLE:Title 1
ORG:Company 1
EMAIL;TYPE=HOME:contact _home_1@localhost.de
EMAIL;TYPE=OTHER:contact_other@localhost.de
EMAIL;TYPE=HOME:contact_home_2@localhost.de
TEL;TYPE=HOME:home_phone
ADR;TYPE=HOME:post office box;extended address;adsress;city;state;postal co
 de;country
REV:20201101T125013Z
X-SOCIALPROFILE;TYPE=OTHER:https://social
END:VCARD
  ''';
    _controller = TextEditingController(text: sample_vcard);
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
        child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              const SizedBox(height: 5),

              _buildDivider(),
              //Expanded(
                TextFormField(
                  keyboardType: TextInputType.multiline,
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
                      //print('validate: ${value.length}');
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
                    print('onFieldSubmittet -> Aktion');
                  },
                ),
              //),

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
    );
  }
}
