import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:theme_manager/change_theme_widget.dart';
import 'package:theme_manager/theme_manager.dart';
import 'dart:convert';
import 'listVcardsWidget.dart';

/*
import 'flutter_secure_storage.dart';
void main() {
  runApp(MaterialApp(home: ItemsWidget()));
}

 */


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      /// WidgetsBinding.instance.window.platformBrightness is used because a
      /// Material BuildContext will not be available outside of the Material app
      defaultBrightnessPreference: BrightnessPreference.system,
      data: (Brightness brightness) => ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlue,
        brightness: brightness,
      ),
      loadBrightnessOnStart: true,
      themedWidgetBuilder: (BuildContext context, ThemeData theme) {
        return MaterialApp(
          title: 'Kontaktverwaltung',
          theme: theme,
          home: ListVcardsWidget()
          );
      },
    );
  }
}
