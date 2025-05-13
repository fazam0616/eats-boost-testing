import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EateriesRecord extends FirestoreRecord {
  EateriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "logoURL" field.
  String? _logoURL;
  String get logoURL => _logoURL ?? '';
  bool hasLogoURL() => _logoURL != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "requiredVisits" field.
  int? _requiredVisits;
  int get requiredVisits => _requiredVisits ?? 0;
  bool hasRequiredVisits() => _requiredVisits != null;

  // "minSpend" field.
  double? _minSpend;
  double get minSpend => _minSpend ?? 0.0;
  bool hasMinSpend() => _minSpend != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "ownerName" field.
  String? _ownerName;
  String get ownerName => _ownerName ?? '';
  bool hasOwnerName() => _ownerName != null;

  // "ownerEmail" field.
  String? _ownerEmail;
  String get ownerEmail => _ownerEmail ?? '';
  bool hasOwnerEmail() => _ownerEmail != null;

  // "ownerPhone" field.
  String? _ownerPhone;
  String get ownerPhone => _ownerPhone ?? '';
  bool hasOwnerPhone() => _ownerPhone != null;

  // "locationStringAddress" field.
  String? _locationStringAddress;
  String get locationStringAddress => _locationStringAddress ?? '';
  bool hasLocationStringAddress() => _locationStringAddress != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _type = snapshotData['type'] as String?;
    _logoURL = snapshotData['logoURL'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _requiredVisits = castToType<int>(snapshotData['requiredVisits']);
    _minSpend = castToType<double>(snapshotData['minSpend']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _city = snapshotData['City'] as String?;
    _ownerName = snapshotData['ownerName'] as String?;
    _ownerEmail = snapshotData['ownerEmail'] as String?;
    _ownerPhone = snapshotData['ownerPhone'] as String?;
    _locationStringAddress = snapshotData['locationStringAddress'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Eateries');

  static Stream<EateriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EateriesRecord.fromSnapshot(s));

  static Future<EateriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EateriesRecord.fromSnapshot(s));

  static EateriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EateriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EateriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EateriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EateriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EateriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEateriesRecordData({
  String? name,
  String? type,
  String? logoURL,
  LatLng? location,
  int? requiredVisits,
  double? minSpend,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? city,
  String? ownerName,
  String? ownerEmail,
  String? ownerPhone,
  String? locationStringAddress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'type': type,
      'logoURL': logoURL,
      'location': location,
      'requiredVisits': requiredVisits,
      'minSpend': minSpend,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'City': city,
      'ownerName': ownerName,
      'ownerEmail': ownerEmail,
      'ownerPhone': ownerPhone,
      'locationStringAddress': locationStringAddress,
    }.withoutNulls,
  );

  return firestoreData;
}

class EateriesRecordDocumentEquality implements Equality<EateriesRecord> {
  const EateriesRecordDocumentEquality();

  @override
  bool equals(EateriesRecord? e1, EateriesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.type == e2?.type &&
        e1?.logoURL == e2?.logoURL &&
        e1?.location == e2?.location &&
        e1?.requiredVisits == e2?.requiredVisits &&
        e1?.minSpend == e2?.minSpend &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.city == e2?.city &&
        e1?.ownerName == e2?.ownerName &&
        e1?.ownerEmail == e2?.ownerEmail &&
        e1?.ownerPhone == e2?.ownerPhone &&
        e1?.locationStringAddress == e2?.locationStringAddress;
  }

  @override
  int hash(EateriesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.type,
        e?.logoURL,
        e?.location,
        e?.requiredVisits,
        e?.minSpend,
        e?.createdAt,
        e?.updatedAt,
        e?.city,
        e?.ownerName,
        e?.ownerEmail,
        e?.ownerPhone,
        e?.locationStringAddress
      ]);

  @override
  bool isValidKey(Object? o) => o is EateriesRecord;
}
