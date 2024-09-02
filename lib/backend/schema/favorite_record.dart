import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoriteRecord extends FirestoreRecord {
  FavoriteRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "item" field.
  DocumentReference? _item;
  DocumentReference? get item => _item;
  bool hasItem() => _item != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _item = snapshotData['item'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Favorite');

  static Stream<FavoriteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoriteRecord.fromSnapshot(s));

  static Future<FavoriteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoriteRecord.fromSnapshot(s));

  static FavoriteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoriteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoriteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoriteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoriteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoriteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoriteRecordData({
  DocumentReference? user,
  DocumentReference? item,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'item': item,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoriteRecordDocumentEquality implements Equality<FavoriteRecord> {
  const FavoriteRecordDocumentEquality();

  @override
  bool equals(FavoriteRecord? e1, FavoriteRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.item == e2?.item &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(FavoriteRecord? e) =>
      const ListEquality().hash([e?.user, e?.item, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is FavoriteRecord;
}
