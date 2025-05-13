import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoneySavedRecord extends FirestoreRecord {
  MoneySavedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "qrCodeRef" field.
  DocumentReference? _qrCodeRef;
  DocumentReference? get qrCodeRef => _qrCodeRef;
  bool hasQrCodeRef() => _qrCodeRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "eateryRef" field.
  DocumentReference? _eateryRef;
  DocumentReference? get eateryRef => _eateryRef;
  bool hasEateryRef() => _eateryRef != null;

  // "moneySaved" field.
  double? _moneySaved;
  double get moneySaved => _moneySaved ?? 0.0;
  bool hasMoneySaved() => _moneySaved != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _qrCodeRef = snapshotData['qrCodeRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _eateryRef = snapshotData['eateryRef'] as DocumentReference?;
    _moneySaved = castToType<double>(snapshotData['moneySaved']);
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MoneySaved');

  static Stream<MoneySavedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoneySavedRecord.fromSnapshot(s));

  static Future<MoneySavedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoneySavedRecord.fromSnapshot(s));

  static MoneySavedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MoneySavedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoneySavedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoneySavedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoneySavedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoneySavedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoneySavedRecordData({
  DocumentReference? qrCodeRef,
  DocumentReference? userRef,
  DocumentReference? eateryRef,
  double? moneySaved,
  DateTime? updatedAt,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'qrCodeRef': qrCodeRef,
      'userRef': userRef,
      'eateryRef': eateryRef,
      'moneySaved': moneySaved,
      'updatedAt': updatedAt,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoneySavedRecordDocumentEquality implements Equality<MoneySavedRecord> {
  const MoneySavedRecordDocumentEquality();

  @override
  bool equals(MoneySavedRecord? e1, MoneySavedRecord? e2) {
    return e1?.qrCodeRef == e2?.qrCodeRef &&
        e1?.userRef == e2?.userRef &&
        e1?.eateryRef == e2?.eateryRef &&
        e1?.moneySaved == e2?.moneySaved &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.status == e2?.status;
  }

  @override
  int hash(MoneySavedRecord? e) => const ListEquality().hash([
        e?.qrCodeRef,
        e?.userRef,
        e?.eateryRef,
        e?.moneySaved,
        e?.updatedAt,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is MoneySavedRecord;
}
