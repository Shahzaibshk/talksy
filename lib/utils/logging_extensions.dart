import 'dart:convert';
import 'dart:developer' as dev;
import 'package:cloud_firestore/cloud_firestore.dart';


extension ExtendedObject on Object? {
  void log([String? logName]) => dev.log(formatted, name: logName ?? '');

  String get formatted {
    if (this is Map) {
      return (this as Map).prettyJson();
    }

    if (this is List<Map>) {
      return (this as List<Map>).prettyJson();
    }

    return toString();
  }
}

extension ExtendedListMapObject on List<Map>? {
  String prettyJson() {
    // Convert the timestamp objects to Datetime
    var spaces = ' ' * 4;
    var encoder = JsonEncoder.withIndent(spaces);

    return encoder.convert(this);
  }
}

extension ExtendedMapObject on Map? {
  String prettyJson() {
    // Convert the timestamp objects to Datetime
    final converted = this?.map(
      (k, v) => MapEntry(
        k,
        v is Timestamp
            ? DateTime.fromMillisecondsSinceEpoch(
              (v).millisecondsSinceEpoch,
            ).toIso8601String()
            : v,
      ),
    );

    var spaces = ' ' * 4;
    var encoder = JsonEncoder.withIndent(spaces);
    return encoder.convert(converted);
  }
}
