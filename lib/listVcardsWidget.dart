import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kontaktverwaltung/vcard_object.dart';
import 'changeThemeWidget.dart';
import 'addVcardWidget.dart';
import 'vcfToObject.dart';

class ListVcardsWidget extends StatefulWidget {
  @override
  _ListVcardsWidgetState createState() => _ListVcardsWidgetState();
}

class _ListVcardsWidgetState extends State<ListVcardsWidget> {
  List<VcardObject> livco = [];
  final _storage = FlutterSecureStorage();

  void addVCard(VcardObject vco) async {
    // add VCard
    print('add');
    // setup: add Activity
    //Navigator.of(context).pop();
  }

  Future<Null> _readAll() async {
    Map<String, String> all = await _storage.readAll();
    VcardObject vco;
    print('readAll -> ${all.length} list');

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
    //box =  Hive.openBox<VCardBox>(vcard_box);
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildDivider() => const SizedBox(height: 15);
    final brightness = Theme.of(context).brightness;
    var myList;
    // Activity names for DropDownList
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontaktliste'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.brightness_6),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ChangeThemeWidget()),
                );
              }),
          /* IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => ListActivitiesSetup()),
                );
              }),

           */


        ],
      ),
      body: ListView.builder(
            itemCount: livco.length,
            itemBuilder: (context, index) {
              VcardObject vco = livco[index];
              Color color = Colors.blue;
              final Icon icon = Icon( Icons.email_outlined,
                color: Colors.blue,
                size: 40,
              );
              return InkWell(
                onLongPress: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    child: AlertDialog(
                      content: Text(
                        "Do you want to delete ${vco.fn}?",
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("No"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        FlatButton(
                          child: Text("Yes"),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            //await box.deleteAt(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: Dismissible(
                  // Show a red background as the item is swiped away.
                  background: Container(color: Colors.redAccent),
                  key: Key(DateTime.now().microsecond.toString()),
                  onDismissed: (direction) async {
                    try {
                      //await box.deleteAt(index);
                    } catch (e) {
                      print('error Dismiss ${vco.fn} \n${e.toString()}');
                    }
                  },
                  child: ListTile(
                    leading: icon,
                    title: Text(vco.fn, style: TextStyle(fontSize: 20)),
                    subtitle: Text(vco.nickname),
                    trailing: IconButton(
                        icon: Icon(Icons.content_copy, size: 20,),),
                        //onPressed: () async => await ()),
                        //onPressed: () async {addVCard(vco); _readAll();}),
                  ),
                ),
              );
            },
          ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddVcardWidget()),
              );
            },
          );
        },
      ),
    );
  }
}
