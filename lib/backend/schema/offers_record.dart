import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OffersRecord extends FirestoreRecord {
  OffersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "eateryRef" field.
  DocumentReference? _eateryRef;
  DocumentReference? get eateryRef => _eateryRef;
  bool hasEateryRef() => _eateryRef != null;

  // "generatedAt" field.
  DateTime? _generatedAt;
  DateTime? get generatedAt => _generatedAt;
  bool hasGeneratedAt() => _generatedAt != null;

  // "menuItemRef" field.
  DocumentReference? _menuItemRef;
  DocumentReference? get menuItemRef => _menuItemRef;
  bool hasMenuItemRef() => _menuItemRef != null;

  // "offerLevel" field.
  int? _offerLevel;
  int get offerLevel => _offerLevel ?? 0;
  bool hasOfferLevel() => _offerLevel != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "discountFactor" field.
  double? _discountFactor;
  double get discountFactor => _discountFactor ?? 0.0;
  bool hasDiscountFactor() => _discountFactor != null;

  // "regularPrice" field.
  double? _regularPrice;
  double get regularPrice => _regularPrice ?? 0.0;
  bool hasRegularPrice() => _regularPrice != null;

  // "offerPrice" field.
  double? _offerPrice;
  double get offerPrice => _offerPrice ?? 0.0;
  bool hasOfferPrice() => _offerPrice != null;

  // "savings" field.
  double? _savings;
  double get savings => _savings ?? 0.0;
  bool hasSavings() => _savings != null;

  // "takeRate" field.
  double? _takeRate;
  double get takeRate => _takeRate ?? 0.0;
  bool hasTakeRate() => _takeRate != null;

  // "offerCharge" field.
  double? _offerCharge;
  double get offerCharge => _offerCharge ?? 0.0;
  bool hasOfferCharge() => _offerCharge != null;

  void _initializeFields() {
    _eateryRef = snapshotData['eateryRef'] as DocumentReference?;
    _generatedAt = snapshotData['generatedAt'] as DateTime?;
    _menuItemRef = snapshotData['menuItemRef'] as DocumentReference?;
    _offerLevel = castToType<int>(snapshotData['offerLevel']);
    _description = snapshotData['description'] as String?;
    _discountFactor = castToType<double>(snapshotData['discountFactor']);
    _regularPrice = castToType<double>(snapshotData['regularPrice']);
    _offerPrice = castToType<double>(snapshotData['offerPrice']);
    _savings = castToType<double>(snapshotData['savings']);
    _takeRate = castToType<double>(snapshotData['takeRate']);
    _offerCharge = castToType<double>(snapshotData['offerCharge']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Offers');

  static Stream<OffersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OffersRecord.fromSnapshot(s));

  static Future<OffersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OffersRecord.fromSnapshot(s));

  static OffersRecord fromSnapshot(DocumentSnapshot snapshot) => OffersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OffersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OffersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OffersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OffersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOffersRecordData({
  DocumentReference? eateryRef,
  DateTime? generatedAt,
  DocumentReference? menuItemRef,
  int? offerLevel,
  String? description,
  double? discountFactor,
  double? regularPrice,
  double? offerPrice,
  double? savings,
  double? takeRate,
  double? offerCharge,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'eateryRef': eateryRef,
      'generatedAt': generatedAt,
      'menuItemRef': menuItemRef,
      'offerLevel': offerLevel,
      'description': description,
      'discountFactor': discountFactor,
      'regularPrice': regularPrice,
      'offerPrice': offerPrice,
      'savings': savings,
      'takeRate': takeRate,
      'offerCharge': offerCharge,
    }.withoutNulls,
  );

  return firestoreData;
}

class OffersRecordDocumentEquality implements Equality<OffersRecord> {
  const OffersRecordDocumentEquality();

  @override
  bool equals(OffersRecord? e1, OffersRecord? e2) {
    return e1?.eateryRef == e2?.eateryRef &&
        e1?.generatedAt == e2?.generatedAt &&
        e1?.menuItemRef == e2?.menuItemRef &&
        e1?.offerLevel == e2?.offerLevel &&
        e1?.description == e2?.description &&
        e1?.discountFactor == e2?.discountFactor &&
        e1?.regularPrice == e2?.regularPrice &&
        e1?.offerPrice == e2?.offerPrice &&
        e1?.savings == e2?.savings &&
        e1?.takeRate == e2?.takeRate &&
        e1?.offerCharge == e2?.offerCharge;
  }

  @override
  int hash(OffersRecord? e) => const ListEquality().hash([
        e?.eateryRef,
        e?.generatedAt,
        e?.menuItemRef,
        e?.offerLevel,
        e?.description,
        e?.discountFactor,
        e?.regularPrice,
        e?.offerPrice,
        e?.savings,
        e?.takeRate,
        e?.offerCharge
      ]);

  @override
  bool isValidKey(Object? o) => o is OffersRecord;
}
