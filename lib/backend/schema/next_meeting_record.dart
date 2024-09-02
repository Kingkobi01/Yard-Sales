import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NextMeetingRecord extends FirestoreRecord {
  NextMeetingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nextMeeting');

  static Stream<NextMeetingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NextMeetingRecord.fromSnapshot(s));

  static Future<NextMeetingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NextMeetingRecord.fromSnapshot(s));

  static NextMeetingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NextMeetingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NextMeetingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NextMeetingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NextMeetingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NextMeetingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNextMeetingRecordData({
  DateTime? date,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class NextMeetingRecordDocumentEquality implements Equality<NextMeetingRecord> {
  const NextMeetingRecordDocumentEquality();

  @override
  bool equals(NextMeetingRecord? e1, NextMeetingRecord? e2) {
    return e1?.date == e2?.date && e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(NextMeetingRecord? e) =>
      const ListEquality().hash([e?.date, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is NextMeetingRecord;
}
