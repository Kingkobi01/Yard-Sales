import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartItemRecord extends FirestoreRecord {
  CartItemRecord._(
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

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _item = snapshotData['item'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _price = castToType<double>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CartItem');

  static Stream<CartItemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartItemRecord.fromSnapshot(s));

  static Future<CartItemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartItemRecord.fromSnapshot(s));

  static CartItemRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CartItemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartItemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartItemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartItemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartItemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartItemRecordData({
  DocumentReference? user,
  DocumentReference? item,
  DateTime? timestamp,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'item': item,
      'timestamp': timestamp,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartItemRecordDocumentEquality implements Equality<CartItemRecord> {
  const CartItemRecordDocumentEquality();

  @override
  bool equals(CartItemRecord? e1, CartItemRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.item == e2?.item &&
        e1?.timestamp == e2?.timestamp &&
        e1?.price == e2?.price;
  }

  @override
  int hash(CartItemRecord? e) =>
      const ListEquality().hash([e?.user, e?.item, e?.timestamp, e?.price]);

  @override
  bool isValidKey(Object? o) => o is CartItemRecord;
}
