import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getImagePathFromURL(String? url) {
  return url;
}

List<QRCodesRecord>? singleIntoListqrCodes(QRCodesRecord? qrCode) {
  // return this eatery in a list
  if (qrCode != null) {
    return [qrCode];
  } else {
    return null;
  }
}

List<int>? listOfNumbers(int? count) {
  if (count == null || count < 0) {
    return [];
  }

  List<int> numbersList = [];
  for (int i = 1; i <= count; i++) {
    numbersList.add(i);
  }
  return numbersList;
}

int? numberplusOne(int? number) {
  // return number minus 1

  if (number != null) {
    return number + 1;
  } else {
    return null;
  }
}

List<DocumentReference>? singleIntoList(DocumentReference? eatery) {
  // return this eatery in a list
  if (eatery != null) {
    return [eatery];
  } else {
    return null;
  }
}

List<DocumentReference>? filteredEateriesFun(
  List<DocumentReference>? eateries,
  List<OffersForMeRecord>? offersForMe,
) {
  if (eateries == null || eateries.isEmpty) {
    return null;
  }

  // Filter eateries based on offersForMe and ensure uniqueness
  var filteredEateries = eateries
      .where((eatery) {
        return offersForMe?.any((offer) => offer.eateryRef == eatery) ?? false;
      })
      .toSet()
      .toList(); // Use Set to remove duplicates and convert back to List

  return filteredEateries;
}

List<dynamic>? newCustomFunction(
  List<dynamic>? ok,
  List<dynamic>? ok2,
) {
  // merge the 2 jsons and return a new json
  if (ok == null || ok2 == null) {
    return null;
  }

  List<dynamic> mergedList = [];

  // Merge the two lists
  for (int i = 0; i < math.max(ok.length, ok2.length); i++) {
    if (i < ok.length) {
      mergedList.add(ok[i]);
    }
    if (i < ok2.length) {
      mergedList.add(ok2[i]);
    }
  }

  return mergedList;
}

List<DocumentReference>? getReferenceFromDoc(List<QRCodesRecord>? qrCodes) {
  // return the reference of these documents
  return qrCodes?.map((qrCode) => qrCode.reference).toList();
}

DateTime? aftrOneMonth() {
  // return me date and time complete after one month. Include time also
  DateTime now = DateTime.now();
  DateTime afterOneMonth = DateTime(
      now.year, now.month + 1, now.day, now.hour, now.minute, now.second);
  return afterOneMonth;
}

String? getRemainingNoOfDays(DateTime? date) {
  // subtract current date from argument's date and return me no. of days
  if (date == null) {
    return null;
  }

  DateTime currentDate = DateTime.now();
  Duration difference = date.difference(currentDate);

  // If the date is in the past, return a message or handle as needed
  if (difference.isNegative) {
    return "The date is in the past";
  }

  int totalMinutes = difference.inMinutes;
  int totalHours = difference.inHours;
  int totalDays = difference.inDays;

  if (totalMinutes < 60) {
    return totalMinutes == 1 ? "1 Minute" : "$totalMinutes Minutes";
  } else if (totalHours < 24) {
    return totalHours == 1 ? "1 Hour" : "$totalHours Hours";
  } else {
    return totalDays == 1 ? "1 Day" : "$totalDays Days";
  }
}

double distance(
  LatLng l1,
  LatLng l2,
) {
  // final double earthRadius = 3959.0; // in miles
  final double earthRadius = 6371000.0; // in meters

  double lat1 = l1.latitude * math.pi / 180.0;
  double lon1 = l1.longitude * math.pi / 180.0;
  double lat2 = l2.latitude * math.pi / 180.0;
  double lon2 = l2.longitude * math.pi / 180.0;

  double dLat = lat2 - lat1;
  double dLon = lon2 - lon1;

  double a = math.pow(math.sin(dLat / 2), 2) +
      math.cos(lat1) * math.cos(lat2) * math.pow(math.sin(dLon / 2), 2);
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  double result = earthRadius * c;

  return double.parse(result.toStringAsFixed(1));
}

DateTime? pastDate() {
  // return one day old date
  return DateTime.now().subtract(Duration(days: 1));
}
