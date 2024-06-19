// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MPostAdapter extends TypeAdapter<MPost> {
  @override
  final int typeId = 0;

  @override
  MPost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MPost(
      after: fields[0] as String?,
      dist: fields[1] as int?,
      posts: (fields[2] as List?)?.cast<MPostData>(),
    );
  }

  @override
  void write(BinaryWriter writer, MPost obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.after)
      ..writeByte(1)
      ..write(obj.dist)
      ..writeByte(2)
      ..write(obj.posts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MPostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MPostDataAdapter extends TypeAdapter<MPostData> {
  @override
  final int typeId = 1;

  @override
  MPostData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MPostData(
      id: fields[0] as String?,
      title: fields[1] as String?,
      selfText: fields[2] as String?,
      url: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MPostData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.selfText)
      ..writeByte(3)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MPostDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
