import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QRCodesRecord extends FirestoreRecord {
  QRCodesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eateryRef" field.
  DocumentReference? _eateryRef;
  DocumentReference? get eateryRef => _eateryRef;
  bool hasEateryRef() => _eateryRef != null;

  // "batch" field.
  int? _batch;
  int get batch => _batch ?? 0;
  bool hasBatch() => _batch != null;

  // "qrCode" field.
  String? _qrCode;
  String get qrCode => _qrCode ?? '';
  bool hasQrCode() => _qrCode != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "status" field.
  QRStatus? _status;
  QRStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "userAddedTime" field.
  DateTime? _userAddedTime;
  DateTime? get userAddedTime => _userAddedTime;
  bool hasUserAddedTime() => _userAddedTime != null;

  // "currentBoostCycle" field.
  int? _currentBoostCycle;
  int get currentBoostCycle => _currentBoostCycle ?? 0;
  bool hasCurrentBoostCycle() => _currentBoostCycle != null;

  // "offersNextGenerationDate" field.
  DateTime? _offersNextGenerationDate;
  DateTime? get offersNextGenerationDate => _offersNextGenerationDate;
  bool hasOffersNextGenerationDate() => _offersNextGenerationDate != null;

  // "boostCycleEndDate" field.
  DateTime? _boostCycleEndDate;
  DateTime? get boostCycleEndDate => _boostCycleEndDate;
  bool hasBoostCycleEndDate() => _boostCycleEndDate != null;

  // "currentBoostCycleRef" field.
  DocumentReference? _currentBoostCycleRef;
  DocumentReference? get currentBoostCycleRef => _currentBoostCycleRef;
  bool hasCurrentBoostCycleRef() => _currentBoostCycleRef != null;

  // "userRemovedTime" field.
  DateTime? _userRemovedTime;
  DateTime? get userRemovedTime => _userRemovedTime;
  bool hasUserRemovedTime() => _userRemovedTime != null;

  void _initializeFields() {
    _eateryRef = snapshotData['eateryRef'] as DocumentReference?;
    _batch = castToType<int>(snapshotData['batch']);
    _qrCode = snapshotData['qrCode'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _status = snapshotData['status'] is QRStatus
        ? snapshotData['status']
        : deserializeEnum<QRStatus>(snapshotData['status']);
    _userAddedTime = snapshotData['userAddedTime'] as DateTime?;
    _currentBoostCycle = castToType<int>(snapshotData['currentBoostCycle']);
    _offersNextGenerationDate =
        snapshotData['offersNextGenerationDate'] as DateTime?;
    _boostCycleEndDate = snapshotData['boostCycleEndDate'] as DateTime?;
    _currentBoostCycleRef =
        snapshotData['currentBoostCycleRef'] as DocumentReference?;
    _userRemovedTime = snapshotData['userRemovedTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('QR_Codes');

  static Stream<QRCodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QRCodesRecord.fromSnapshot(s));

  static Future<QRCodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QRCodesRecord.fromSnapshot(s));

  static QRCodesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QRCodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QRCodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QRCodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QRCodesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QRCodesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQRCodesRecordData({
  DocumentReference? eateryRef,
  int? batch,
  String? qrCode,
  DocumentReference? userRef,
  QRStatus? status,
  DateTime? userAddedTime,
  int? currentBoostCycle,
  DateTime? offersNextGenerationDate,
  DateTime? boostCycleEndDate,
  DocumentReference? currentBoostCycleRef,
  DateTime? userRemovedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eateryRef': eateryRef,
      'batch': batch,
      'qrCode': qrCode,
      'userRef': userRef,
      'status': status,
      'userAddedTime': userAddedTime,
      'currentBoostCycle': currentBoostCycle,
      'offersNextGenerationDate': offersNextGenerationDate,
      'boostCycleEndDate': boostCycleEndDate,
      'currentBoostCycleRef': currentBoostCycleRef,
      'userRemovedTime': userRemovedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class QRCodesRecordDocumentEquality implements Equality<QRCodesRecord> {
  const QRCodesRecordDocumentEquality();

  @override
  bool equals(QRCodesRecord? e1, QRCodesRecord? e2) {
    return e1?.eateryRef == e2?.eateryRef &&
        e1?.batch == e2?.batch &&
        e1?.qrCode == e2?.qrCode &&
        e1?.userRef == e2?.userRef &&
        e1?.status == e2?.status &&
        e1?.userAddedTime == e2?.userAddedTime &&
        e1?.currentBoostCycle == e2?.currentBoostCycle &&
        e1?.offersNextGenerationDate == e2?.offersNextGenerationDate &&
        e1?.boostCycleEndDate == e2?.boostCycleEndDate &&
        e1?.currentBoostCycleRef == e2?.currentBoostCycleRef &&
        e1?.userRemovedTime == e2?.userRemovedTime;
  }

  @override
  int hash(QRCodesRecord? e) => const ListEquality().hash([
        e?.eateryRef,
        e?.batch,
        e?.qrCode,
        e?.userRef,
        e?.status,
        e?.userAddedTime,
        e?.currentBoostCycle,
        e?.offersNextGenerationDate,
        e?.boostCycleEndDate,
        e?.currentBoostCycleRef,
        e?.userRemovedTime
      ]);

  @override
  bool isValidKey(Object? o) => o is QRCodesRecord;
}
