import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';

part 'modell.g.dart';


String vcard_box = "vcard_box"; // global usage
const String usersBox = "users";
const String appSetupBox = "app_setup";


//
// vcard
//
@HiveType(typeId: 0)
class VCardBox extends HiveObject with Comparable<VCardBox>, Compare<VCardBox> {
  final formatter = DateFormat("E dd.MM.yyyy HH:mm");

  @HiveField(0)
  String fn;
  @HiveField(1)
  String vcard_map;

  VCardBox({this.fn, this.vcard_map});

  @override
  String toString() {
    return '$fn ';
  }

  @override
  int compareTo(VCardBox other) =>
      (other.fn).compareTo(fn);
}

//
// ActivitySetup
//
@HiveType(typeId: 1)
class ActivitySetup extends HiveObject with Comparable<ActivitySetup>, Compare<ActivitySetup>{
  @HiveField(0)
  String name;


  ActivitySetup({this.name});

  @override
  String toString() {
    return '$name ';
  }

  @override
  int compareTo(ActivitySetup other) =>
      (name).compareTo(other.name);
}

//
// User
//
@HiveType(typeId: 2)
class User extends HiveObject with Comparable<User>, Compare<User>{
  @HiveField(0)
  String name;

  User({this.name});

  @override
  String toString() {
    return '$name';
  }

  @override
  int compareTo(User other) =>
      (name).compareTo(other.name);

}


mixin Compare<T> on Comparable<T> {
  bool operator <=(T other) => this.compareTo(other) <= 0;

  bool operator >=(T other) => this.compareTo(other) >= 0;

  bool operator <(T other) => this.compareTo(other) < 0;

  bool operator >(T other) => this.compareTo(other) > 0;

  bool operator ==(other) => other is T && this.compareTo(other) == 0;
}