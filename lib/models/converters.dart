import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter implements JsonConverter<Timestamp, Object> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Object json) {
    if (json is Timestamp) return json;
    if (json is Map) {
      return Timestamp.fromMillisecondsSinceEpoch(json['_seconds'] * 1000);
    }
    return Timestamp.now();
  }

  @override
  Object toJson(Timestamp timestamp) => timestamp;
}
