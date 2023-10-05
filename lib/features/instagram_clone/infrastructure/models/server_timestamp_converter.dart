import 'package:cloud_firestore/cloud_firestore.dart';

class ServerTimestampConverter {
  static DateTime fromJson(Object json) {
    return (json as Timestamp).toDate();
  }

  static Object toJson(Object fieldValue) {
    return fieldValue as FieldValue;
  }
}
