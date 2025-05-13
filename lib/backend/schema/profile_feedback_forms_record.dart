import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileFeedbackFormsRecord extends FirestoreRecord {
  ProfileFeedbackFormsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _feedback = snapshotData['feedback'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ProfileFeedbackForms');

  static Stream<ProfileFeedbackFormsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ProfileFeedbackFormsRecord.fromSnapshot(s));

  static Future<ProfileFeedbackFormsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ProfileFeedbackFormsRecord.fromSnapshot(s));

  static ProfileFeedbackFormsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfileFeedbackFormsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfileFeedbackFormsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfileFeedbackFormsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfileFeedbackFormsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfileFeedbackFormsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfileFeedbackFormsRecordData({
  String? feedback,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'feedback': feedback,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfileFeedbackFormsRecordDocumentEquality
    implements Equality<ProfileFeedbackFormsRecord> {
  const ProfileFeedbackFormsRecordDocumentEquality();

  @override
  bool equals(ProfileFeedbackFormsRecord? e1, ProfileFeedbackFormsRecord? e2) {
    return e1?.feedback == e2?.feedback && e1?.userRef == e2?.userRef;
  }

  @override
  int hash(ProfileFeedbackFormsRecord? e) =>
      const ListEquality().hash([e?.feedback, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is ProfileFeedbackFormsRecord;
}
