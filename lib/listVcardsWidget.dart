import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:kontaktverwaltung/vcard_object.dart';
import 'modell.dart';
import 'addVcardWidget.dart';
import 'changeThemeWidget.dart';
import 'addVcardWidget.dart';


class ListVcardsWidget extends StatefulWidget {
  @override
  _ListVcardsWidgetState createState() => _ListVcardsWidgetState();
}

class _ListVcardsWidgetState extends State<ListVcardsWidget> {
  Box<VCardBox> box;

  List<VcardObject> listVCards = [];

  void addVCard(VcardObject vco) async {
    // add VCard
    await box.add(VCardBox(
        fn: vco.fn,
        vcard_map: vco.toMap().toString()));
    // setup: add Activity
    //Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
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
      body: ValueListenableBuilder(
        valueListenable: Hive.box<VCardBox>(vcard_box).listenable(),
        builder: (context, Box<VCardBox> box, _) {
          if (box.values.isEmpty) {
            print("noch keine Kontakte vorhanden");
            return Center(
              child: Text("noch keine Kontakte vorhanden"),
            );
          }

          if (listVCards.length > 0) listVCards.sort();
          return ListView.builder(
            itemCount: listVCards.length,
            itemBuilder: (context, index) {
              VcardObject vco = listVCards[index];
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
                            await box.deleteAt(index);
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
                      await box.deleteAt(index);
                    } catch (e) {
                      print('error Dismiss ${vco.fn} \n${e.toString()}');
                    }
                  },
                  child: ListTile(
                    leading: icon,
                    title: Text(vco.fn, style: TextStyle(fontSize: 25)),
                    subtitle: Text(vco.nickname),
                    trailing: IconButton(
                        icon: Icon(Icons.content_copy, size: 25,),
                        onPressed: () async => await addVCard(vco)),
                  ),
                ),
              );
            },
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
