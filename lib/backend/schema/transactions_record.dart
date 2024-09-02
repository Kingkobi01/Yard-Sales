import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Buyer" field.
  DocumentReference? _buyer;
  DocumentReference? get buyer => _buyer;
  bool hasBuyer() => _buyer != null;

  // "Seller" field.
  DocumentReference? _seller;
  DocumentReference? get seller => _seller;
  bool hasSeller() => _seller != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "TransactionRef" field.
  String? _transactionRef;
  String get transactionRef => _transactionRef ?? '';
  bool hasTransactionRef() => _transactionRef != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "success" field.
  bool? _success;
  bool get success => _success ?? false;
  bool hasSuccess() => _success != null;

  // "item" field.
  DocumentReference? _item;
  DocumentReference? get item => _item;
  bool hasItem() => _item != null;

  void _initializeFields() {
    _buyer = snapshotData['Buyer'] as DocumentReference?;
    _seller = snapshotData['Seller'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _transactionRef = snapshotData['TransactionRef'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _success = snapshotData['success'] as bool?;
    _item = snapshotData['item'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  DocumentReference? buyer,
  DocumentReference? seller,
  DateTime? timestamp,
  String? transactionRef,
  double? amount,
  bool? success,
  DocumentReference? item,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Buyer': buyer,
      'Seller': seller,
      'timestamp': timestamp,
      'TransactionRef': transactionRef,
      'amount': amount,
      'success': success,
      'item': item,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.buyer == e2?.buyer &&
        e1?.seller == e2?.seller &&
        e1?.timestamp == e2?.timestamp &&
        e1?.transactionRef == e2?.transactionRef &&
        e1?.amount == e2?.amount &&
        e1?.success == e2?.success &&
        e1?.item == e2?.item;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.buyer,
        e?.seller,
        e?.timestamp,
        e?.transactionRef,
        e?.amount,
        e?.success,
        e?.item
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
