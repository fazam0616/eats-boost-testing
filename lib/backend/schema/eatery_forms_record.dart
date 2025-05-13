import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EateryFormsRecord extends FirestoreRecord {
  EateryFormsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eateryName" field.
  String? _eateryName;
  String get eateryName => _eateryName ?? '';
  bool hasEateryName() => _eateryName != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "end" field.
  String? _end;
  String get end => _end ?? '';
  bool hasEnd() => _end != null;

  // "eateryType" field.
  String? _eateryType;
  String get eateryType => _eateryType ?? '';
  bool hasEateryType() => _eateryType != null;

  // "oftenVisits" field.
  String? _oftenVisits;
  String get oftenVisits => _oftenVisits ?? '';
  bool hasOftenVisits() => _oftenVisits != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _eateryName = snapshotData['eateryName'] as String?;
    _city = snapshotData['city'] as String?;
    _end = snapshotData['end'] as String?;
    _eateryType = snapshotData['eateryType'] as String?;
    _oftenVisits = snapshotData['oftenVisits'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('EateryForms');

  static Stream<EateryFormsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EateryFormsRecord.fromSnapshot(s));

  static Future<EateryFormsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EateryFormsRecord.fromSnapshot(s));

  static EateryFormsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EateryFormsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EateryFormsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EateryFormsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EateryFormsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EateryFormsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEateryFormsRecordData({
  String? eateryName,
  String? city,
  String? end,
  String? eateryType,
  String? oftenVisits,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eateryName': eateryName,
      'city': city,
      'end': end,
      'eateryType': eateryType,
      'oftenVisits': oftenVisits,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class EateryFormsRecordDocumentEquality implements Equality<EateryFormsRecord> {
  const EateryFormsRecordDocumentEquality();

  @override
  bool equals(EateryFormsRecord? e1, EateryFormsRecord? e2) {
    return e1?.eateryName == e2?.eateryName &&
        e1?.city == e2?.city &&
        e1?.end == e2?.end &&
        e1?.eateryType == e2?.eateryType &&
        e1?.oftenVisits == e2?.oftenVisits &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(EateryFormsRecord? e) => const ListEquality().hash([
        e?.eateryName,
        e?.city,
        e?.end,
        e?.eateryType,
        e?.oftenVisits,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is EateryFormsRecord;
}
