import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VisitsRemovedRecord extends FirestoreRecord {
  VisitsRemovedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('visits_removed');

  static Stream<VisitsRemovedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VisitsRemovedRecord.fromSnapshot(s));

  static Future<VisitsRemovedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VisitsRemovedRecord.fromSnapshot(s));

  static VisitsRemovedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VisitsRemovedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VisitsRemovedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VisitsRemovedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VisitsRemovedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VisitsRemovedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVisitsRemovedRecordData({
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class VisitsRemovedRecordDocumentEquality
    implements Equality<VisitsRemovedRecord> {
  const VisitsRemovedRecordDocumentEquality();

  @override
  bool equals(VisitsRemovedRecord? e1, VisitsRemovedRecord? e2) {
    return e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(VisitsRemovedRecord? e) => const ListEquality().hash([e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is VisitsRemovedRecord;
}
