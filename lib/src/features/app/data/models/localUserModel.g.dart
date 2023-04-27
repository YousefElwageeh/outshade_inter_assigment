// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localUserModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalUserModelAdapter extends TypeAdapter<LocalUserModel> {
  @override
  final int typeId = 0;

  @override
  LocalUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalUserModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalUserModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
