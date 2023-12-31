// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kayit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KayitModelAdapter extends TypeAdapter<KayitModel> {
  @override
  final int typeId = 1;

  @override
  KayitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KayitModel(
      mail: fields[0] as String,
      sifre: fields[1] as String,
      id: fields[2] as String,
      dateTime: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, KayitModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.mail)
      ..writeByte(1)
      ..write(obj.sifre)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KayitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
