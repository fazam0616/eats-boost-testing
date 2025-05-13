import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OffersFormulaRecord extends FirestoreRecord {
  OffersFormulaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "level" field.
  int? _level;
  int get level => _level ?? 0;
  bool hasLevel() => _level != null;

  // "probability" field.
  double? _probability;
  double get probability => _probability ?? 0.0;
  bool hasProbability() => _probability != null;

  void _initializeFields() {
    _level = castToType<int>(snapshotData['level']);
    _probability = castToType<double>(snapshotData['probability']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Offers_Formula');

  static Stream<OffersFormulaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OffersFormulaRecord.fromSnapshot(s));

  static Future<OffersFormulaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OffersFormulaRecord.fromSnapshot(s));

  static OffersFormulaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OffersFormulaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OffersFormulaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OffersFormulaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OffersFormulaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OffersFormulaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOffersFormulaRecordData({
  int? level,
  double? probability,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'level': level,
      'probability': probability,
    }.withoutNulls,
  );

  return firestoreData;
}

class OffersFormulaRecordDocumentEquality
    implements Equality<OffersFormulaRecord> {
  const OffersFormulaRecordDocumentEquality();

  @override
  bool equals(OffersFormulaRecord? e1, OffersFormulaRecord? e2) {
    return e1?.level == e2?.level && e1?.probability == e2?.probability;
  }

  @override
  int hash(OffersFormulaRecord? e) =>
      const ListEquality().hash([e?.level, e?.probability]);

  @override
  bool isValidKey(Object? o) => o is OffersFormulaRecord;
}
