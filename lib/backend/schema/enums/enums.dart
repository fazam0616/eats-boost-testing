import 'package:collection/collection.dart';

enum BottomTab {
  MyOffers,
  GenerateOffer,
  Eateries,
}

enum VisitStatus {
  Pending,
  Approved,
  Rejected,
}

enum QRStatus {
  Inactive,
  Active,
  Removed,
}

enum OfferStatus {
  Active,
  Redeemed,
  Expired,
}

enum NotificationType {
  visitRejected,
  visitLoggedForAdmin,
  visitApproved,
  periodicOffer,
  periodicOfferExpiry,
  eaterySuspended,
}

enum OfferExpireReason {
  fifteenSeconds,
  sevenDays,
}

enum InfoTypes {
  Eatery,
  MyOffers,
  GenerateOffers,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (BottomTab):
      return BottomTab.values.deserialize(value) as T?;
    case (VisitStatus):
      return VisitStatus.values.deserialize(value) as T?;
    case (QRStatus):
      return QRStatus.values.deserialize(value) as T?;
    case (OfferStatus):
      return OfferStatus.values.deserialize(value) as T?;
    case (NotificationType):
      return NotificationType.values.deserialize(value) as T?;
    case (OfferExpireReason):
      return OfferExpireReason.values.deserialize(value) as T?;
    case (InfoTypes):
      return InfoTypes.values.deserialize(value) as T?;
    default:
      return null;
  }
}
