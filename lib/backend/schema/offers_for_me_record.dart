import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OffersForMeRecord extends FirestoreRecord {
  OffersForMeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "offerRef" field.
  DocumentReference? _offerRef;
  DocumentReference? get offerRef => _offerRef;
  bool hasOfferRef() => _offerRef != null;

  // "status" field.
  OfferStatus? _status;
  OfferStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "eateryRef" field.
  DocumentReference? _eateryRef;
  DocumentReference? get eateryRef => _eateryRef;
  bool hasEateryRef() => _eateryRef != null;

  // "triedRedeem" field.
  bool? _triedRedeem;
  bool get triedRedeem => _triedRedeem ?? false;
  bool hasTriedRedeem() => _triedRedeem != null;

  // "expiryDate" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  // "expiredReason" field.
  OfferExpireReason? _expiredReason;
  OfferExpireReason? get expiredReason => _expiredReason;
  bool hasExpiredReason() => _expiredReason != null;

  // "isWelcomeOffer" field.
  bool? _isWelcomeOffer;
  bool get isWelcomeOffer => _isWelcomeOffer ?? false;
  bool hasIsWelcomeOffer() => _isWelcomeOffer != null;

  // "qrCodeRef" field.
  DocumentReference? _qrCodeRef;
  DocumentReference? get qrCodeRef => _qrCodeRef;
  bool hasQrCodeRef() => _qrCodeRef != null;

  // "boostCycleRef" field.
  DocumentReference? _boostCycleRef;
  DocumentReference? get boostCycleRef => _boostCycleRef;
  bool hasBoostCycleRef() => _boostCycleRef != null;

  // "redeemedTime" field.
  DateTime? _redeemedTime;
  DateTime? get redeemedTime => _redeemedTime;
  bool hasRedeemedTime() => _redeemedTime != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _offerRef = snapshotData['offerRef'] as DocumentReference?;
    _status = snapshotData['status'] is OfferStatus
        ? snapshotData['status']
        : deserializeEnum<OfferStatus>(snapshotData['status']);
    _eateryRef = snapshotData['eateryRef'] as DocumentReference?;
    _triedRedeem = snapshotData['triedRedeem'] as bool?;
    _expiryDate = snapshotData['expiryDate'] as DateTime?;
    _expiredReason = snapshotData['expiredReason'] is OfferExpireReason
        ? snapshotData['expiredReason']
        : deserializeEnum<OfferExpireReason>(snapshotData['expiredReason']);
    _isWelcomeOffer = snapshotData['isWelcomeOffer'] as bool?;
    _qrCodeRef = snapshotData['qrCodeRef'] as DocumentReference?;
    _boostCycleRef = snapshotData['boostCycleRef'] as DocumentReference?;
    _redeemedTime = snapshotData['redeemedTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('offersForMe');

  static Stream<OffersForMeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OffersForMeRecord.fromSnapshot(s));

  static Future<OffersForMeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OffersForMeRecord.fromSnapshot(s));

  static OffersForMeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OffersForMeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OffersForMeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OffersForMeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OffersForMeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OffersForMeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOffersForMeRecordData({
  DocumentReference? userRef,
  DocumentReference? offerRef,
  OfferStatus? status,
  DocumentReference? eateryRef,
  bool? triedRedeem,
  DateTime? expiryDate,
  OfferExpireReason? expiredReason,
  bool? isWelcomeOffer,
  DocumentReference? qrCodeRef,
  DocumentReference? boostCycleRef,
  DateTime? redeemedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'offerRef': offerRef,
      'status': status,
      'eateryRef': eateryRef,
      'triedRedeem': triedRedeem,
      'expiryDate': expiryDate,
      'expiredReason': expiredReason,
      'isWelcomeOffer': isWelcomeOffer,
      'qrCodeRef': qrCodeRef,
      'boostCycleRef': boostCycleRef,
      'redeemedTime': redeemedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class OffersForMeRecordDocumentEquality implements Equality<OffersForMeRecord> {
  const OffersForMeRecordDocumentEquality();

  @override
  bool equals(OffersForMeRecord? e1, OffersForMeRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.offerRef == e2?.offerRef &&
        e1?.status == e2?.status &&
        e1?.eateryRef == e2?.eateryRef &&
        e1?.triedRedeem == e2?.triedRedeem &&
        e1?.expiryDate == e2?.expiryDate &&
        e1?.expiredReason == e2?.expiredReason &&
        e1?.isWelcomeOffer == e2?.isWelcomeOffer &&
        e1?.qrCodeRef == e2?.qrCodeRef &&
        e1?.boostCycleRef == e2?.boostCycleRef &&
        e1?.redeemedTime == e2?.redeemedTime;
  }

  @override
  int hash(OffersForMeRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.offerRef,
        e?.status,
        e?.eateryRef,
        e?.triedRedeem,
        e?.expiryDate,
        e?.expiredReason,
        e?.isWelcomeOffer,
        e?.qrCodeRef,
        e?.boostCycleRef,
        e?.redeemedTime
      ]);

  @override
  bool isValidKey(Object? o) => o is OffersForMeRecord;
}
