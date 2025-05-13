import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "forUserRef" field.
  DocumentReference? _forUserRef;
  DocumentReference? get forUserRef => _forUserRef;
  bool hasForUserRef() => _forUserRef != null;

  // "visitRef" field.
  DocumentReference? _visitRef;
  DocumentReference? get visitRef => _visitRef;
  bool hasVisitRef() => _visitRef != null;

  // "type" field.
  NotificationType? _type;
  NotificationType? get type => _type;
  bool hasType() => _type != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "isSeen" field.
  bool? _isSeen;
  bool get isSeen => _isSeen ?? false;
  bool hasIsSeen() => _isSeen != null;

  // "creationDate" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "isForAdmin" field.
  bool? _isForAdmin;
  bool get isForAdmin => _isForAdmin ?? false;
  bool hasIsForAdmin() => _isForAdmin != null;

  // "byUserRef" field.
  DocumentReference? _byUserRef;
  DocumentReference? get byUserRef => _byUserRef;
  bool hasByUserRef() => _byUserRef != null;

  // "eateryRef" field.
  DocumentReference? _eateryRef;
  DocumentReference? get eateryRef => _eateryRef;
  bool hasEateryRef() => _eateryRef != null;

  // "offersCount" field.
  int? _offersCount;
  int get offersCount => _offersCount ?? 0;
  bool hasOffersCount() => _offersCount != null;

  // "hoursLeft" field.
  int? _hoursLeft;
  int get hoursLeft => _hoursLeft ?? 0;
  bool hasHoursLeft() => _hoursLeft != null;

  void _initializeFields() {
    _forUserRef = snapshotData['forUserRef'] as DocumentReference?;
    _visitRef = snapshotData['visitRef'] as DocumentReference?;
    _type = snapshotData['type'] is NotificationType
        ? snapshotData['type']
        : deserializeEnum<NotificationType>(snapshotData['type']);
    _reason = snapshotData['reason'] as String?;
    _isSeen = snapshotData['isSeen'] as bool?;
    _creationDate = snapshotData['creationDate'] as DateTime?;
    _isForAdmin = snapshotData['isForAdmin'] as bool?;
    _byUserRef = snapshotData['byUserRef'] as DocumentReference?;
    _eateryRef = snapshotData['eateryRef'] as DocumentReference?;
    _offersCount = castToType<int>(snapshotData['offersCount']);
    _hoursLeft = castToType<int>(snapshotData['hoursLeft']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  DocumentReference? forUserRef,
  DocumentReference? visitRef,
  NotificationType? type,
  String? reason,
  bool? isSeen,
  DateTime? creationDate,
  bool? isForAdmin,
  DocumentReference? byUserRef,
  DocumentReference? eateryRef,
  int? offersCount,
  int? hoursLeft,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'forUserRef': forUserRef,
      'visitRef': visitRef,
      'type': type,
      'reason': reason,
      'isSeen': isSeen,
      'creationDate': creationDate,
      'isForAdmin': isForAdmin,
      'byUserRef': byUserRef,
      'eateryRef': eateryRef,
      'offersCount': offersCount,
      'hoursLeft': hoursLeft,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.forUserRef == e2?.forUserRef &&
        e1?.visitRef == e2?.visitRef &&
        e1?.type == e2?.type &&
        e1?.reason == e2?.reason &&
        e1?.isSeen == e2?.isSeen &&
        e1?.creationDate == e2?.creationDate &&
        e1?.isForAdmin == e2?.isForAdmin &&
        e1?.byUserRef == e2?.byUserRef &&
        e1?.eateryRef == e2?.eateryRef &&
        e1?.offersCount == e2?.offersCount &&
        e1?.hoursLeft == e2?.hoursLeft;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.forUserRef,
        e?.visitRef,
        e?.type,
        e?.reason,
        e?.isSeen,
        e?.creationDate,
        e?.isForAdmin,
        e?.byUserRef,
        e?.eateryRef,
        e?.offersCount,
        e?.hoursLeft
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
