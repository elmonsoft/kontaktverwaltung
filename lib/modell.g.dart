// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modell.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VCardBoxAdapter extends TypeAdapter<VCardBox> {
  @override
  final int typeId = 0;

  @override
  VCardBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VCardBox(
      fn: fields[0] as String,
      vcard_map: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VCardBox obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fn)
      ..writeByte(1)
      ..write(obj.vcard_map);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VCardBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ActivitySetupAdapter extends TypeAdapter<ActivitySetup> {
  @override
  final int typeId = 1;

  @override
  ActivitySetup read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActivitySetup(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ActivitySetup obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivitySetupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 2;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
