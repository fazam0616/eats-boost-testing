import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BoostCyclesRecord extends FirestoreRecord {
  BoostCyclesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "qrCodeRef" field.
  DocumentReference? _qrCodeRef;
  DocumentReference? get qrCodeRef => _qrCodeRef;
  bool hasQrCodeRef() => _qrCodeRef != null;

  // "eateryRef" field.
  DocumentReference? _eateryRef;
  DocumentReference? get eateryRef => _eateryRef;
  bool hasEateryRef() => _eateryRef != null;

  // "cycleNumber" field.
  int? _cycleNumber;
  int get cycleNumber => _cycleNumber ?? 0;
  bool hasCycleNumber() => _cycleNumber != null;

  // "boostCycleExpiryDate" field.
  DateTime? _boostCycleExpiryDate;
  DateTime? get boostCycleExpiryDate => _boostCycleExpiryDate;
  bool hasBoostCycleExpiryDate() => _boostCycleExpiryDate != null;

  // "creationDate" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _qrCodeRef = snapshotData['qrCodeRef'] as DocumentReference?;
    _eateryRef = snapshotData['eateryRef'] as DocumentReference?;
    _cycleNumber = castToType<int>(snapshotData['cycleNumber']);
    _boostCycleExpiryDate = snapshotData['boostCycleExpiryDate'] as DateTime?;
    _creationDate = snapshotData['creationDate'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BoostCycles');

  static Stream<BoostCyclesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BoostCyclesRecord.fromSnapshot(s));

  static Future<BoostCyclesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BoostCyclesRecord.fromSnapshot(s));

  static BoostCyclesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BoostCyclesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BoostCyclesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BoostCyclesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BoostCyclesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BoostCyclesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBoostCyclesRecordData({
  DocumentReference? qrCodeRef,
  DocumentReference? eateryRef,
  int? cycleNumber,
  DateTime? boostCycleExpiryDate,
  DateTime? creationDate,
  DocumentReference? userRef,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'qrCodeRef': qrCodeRef,
      'eateryRef': eateryRef,
      'cycleNumber': cycleNumber,
      'boostCycleExpiryDate': boostCycleExpiryDate,
      'creationDate': creationDate,
      'userRef': userRef,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class BoostCyclesRecordDocumentEquality implements Equality<BoostCyclesRecord> {
  const BoostCyclesRecordDocumentEquality();

  @override
  bool equals(BoostCyclesRecord? e1, BoostCyclesRecord? e2) {
    return e1?.qrCodeRef == e2?.qrCodeRef &&
        e1?.eateryRef == e2?.eateryRef &&
        e1?.cycleNumber == e2?.cycleNumber &&
        e1?.boostCycleExpiryDate == e2?.boostCycleExpiryDate &&
        e1?.creationDate == e2?.creationDate &&
        e1?.userRef == e2?.userRef &&
        e1?.status == e2?.status;
  }

  @override
  int hash(BoostCyclesRecord? e) => const ListEquality().hash([
        e?.qrCodeRef,
        e?.eateryRef,
        e?.cycleNumber,
        e?.boostCycleExpiryDate,
        e?.creationDate,
        e?.userRef,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is BoostCyclesRecord;
}
