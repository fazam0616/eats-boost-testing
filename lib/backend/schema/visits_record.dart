import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitsRecord extends FirestoreRecord {
  VisitsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reviewedAt" field.
  DateTime? _reviewedAt;
  DateTime? get reviewedAt => _reviewedAt;
  bool hasReviewedAt() => _reviewedAt != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "receiptImage" field.
  String? _receiptImage;
  String get receiptImage => _receiptImage ?? '';
  bool hasReceiptImage() => _receiptImage != null;

  // "eateryRef" field.
  DocumentReference? _eateryRef;
  DocumentReference? get eateryRef => _eateryRef;
  bool hasEateryRef() => _eateryRef != null;

  // "status" field.
  VisitStatus? _status;
  VisitStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "qrCodeRef" field.
  DocumentReference? _qrCodeRef;
  DocumentReference? get qrCodeRef => _qrCodeRef;
  bool hasQrCodeRef() => _qrCodeRef != null;

  // "boostCycleRef" field.
  DocumentReference? _boostCycleRef;
  DocumentReference? get boostCycleRef => _boostCycleRef;
  bool hasBoostCycleRef() => _boostCycleRef != null;

  void _initializeFields() {
    _reviewedAt = snapshotData['reviewedAt'] as DateTime?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _receiptImage = snapshotData['receiptImage'] as String?;
    _eateryRef = snapshotData['eateryRef'] as DocumentReference?;
    _status = snapshotData['status'] is VisitStatus
        ? snapshotData['status']
        : deserializeEnum<VisitStatus>(snapshotData['status']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _qrCodeRef = snapshotData['qrCodeRef'] as DocumentReference?;
    _boostCycleRef = snapshotData['boostCycleRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Visits');

  static Stream<VisitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VisitsRecord.fromSnapshot(s));

  static Future<VisitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VisitsRecord.fromSnapshot(s));

  static VisitsRecord fromSnapshot(DocumentSnapshot snapshot) => VisitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VisitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VisitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VisitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VisitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisitsRecordData({
  DateTime? reviewedAt,
  DateTime? createdAt,
  String? receiptImage,
  DocumentReference? eateryRef,
  VisitStatus? status,
  DocumentReference? userRef,
  DocumentReference? qrCodeRef,
  DocumentReference? boostCycleRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reviewedAt': reviewedAt,
      'createdAt': createdAt,
      'receiptImage': receiptImage,
      'eateryRef': eateryRef,
      'status': status,
      'userRef': userRef,
      'qrCodeRef': qrCodeRef,
      'boostCycleRef': boostCycleRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class VisitsRecordDocumentEquality implements Equality<VisitsRecord> {
  const VisitsRecordDocumentEquality();

  @override
  bool equals(VisitsRecord? e1, VisitsRecord? e2) {
    return e1?.reviewedAt == e2?.reviewedAt &&
        e1?.createdAt == e2?.createdAt &&
        e1?.receiptImage == e2?.receiptImage &&
        e1?.eateryRef == e2?.eateryRef &&
        e1?.status == e2?.status &&
        e1?.userRef == e2?.userRef &&
        e1?.qrCodeRef == e2?.qrCodeRef &&
        e1?.boostCycleRef == e2?.boostCycleRef;
  }

  @override
  int hash(VisitsRecord? e) => const ListEquality().hash([
        e?.reviewedAt,
        e?.createdAt,
        e?.receiptImage,
        e?.eateryRef,
        e?.status,
        e?.userRef,
        e?.qrCodeRef,
        e?.boostCycleRef
      ]);

  @override
  bool isValidKey(Object? o) => o is VisitsRecord;
}
