import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "email_verified" field.
  bool? _emailVerified;
  bool get emailVerified => _emailVerified ?? false;
  bool hasEmailVerified() => _emailVerified != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "isFirstLogin" field.
  bool? _isFirstLogin;
  bool get isFirstLogin => _isFirstLogin ?? false;
  bool hasIsFirstLogin() => _isFirstLogin != null;

  // "isAccountDeleted" field.
  bool? _isAccountDeleted;
  bool get isAccountDeleted => _isAccountDeleted ?? false;
  bool hasIsAccountDeleted() => _isAccountDeleted != null;

  // "birthDate" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  bool hasBirthDate() => _birthDate != null;

  // "isReceivingNotifications" field.
  bool? _isReceivingNotifications;
  bool get isReceivingNotifications => _isReceivingNotifications ?? false;
  bool hasIsReceivingNotifications() => _isReceivingNotifications != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _city = snapshotData['city'] as String?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _emailVerified = snapshotData['email_verified'] as bool?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isFirstLogin = snapshotData['isFirstLogin'] as bool?;
    _isAccountDeleted = snapshotData['isAccountDeleted'] as bool?;
    _birthDate = snapshotData['birthDate'] as DateTime?;
    _isReceivingNotifications =
        snapshotData['isReceivingNotifications'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? uid,
  DateTime? createdTime,
  String? city,
  bool? isAdmin,
  String? photoUrl,
  String? displayName,
  String? firstName,
  String? lastName,
  bool? emailVerified,
  String? phoneNumber,
  bool? isFirstLogin,
  bool? isAccountDeleted,
  DateTime? birthDate,
  bool? isReceivingNotifications,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'uid': uid,
      'created_time': createdTime,
      'city': city,
      'isAdmin': isAdmin,
      'photo_url': photoUrl,
      'display_name': displayName,
      'first_name': firstName,
      'last_name': lastName,
      'email_verified': emailVerified,
      'phone_number': phoneNumber,
      'isFirstLogin': isFirstLogin,
      'isAccountDeleted': isAccountDeleted,
      'birthDate': birthDate,
      'isReceivingNotifications': isReceivingNotifications,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.city == e2?.city &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.displayName == e2?.displayName &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.emailVerified == e2?.emailVerified &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isFirstLogin == e2?.isFirstLogin &&
        e1?.isAccountDeleted == e2?.isAccountDeleted &&
        e1?.birthDate == e2?.birthDate &&
        e1?.isReceivingNotifications == e2?.isReceivingNotifications;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.uid,
        e?.createdTime,
        e?.city,
        e?.isAdmin,
        e?.photoUrl,
        e?.displayName,
        e?.firstName,
        e?.lastName,
        e?.emailVerified,
        e?.phoneNumber,
        e?.isFirstLogin,
        e?.isAccountDeleted,
        e?.birthDate,
        e?.isReceivingNotifications
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
