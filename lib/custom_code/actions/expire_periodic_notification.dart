// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> expirePeriodicNotification(DocumentReference? userRef) async {
  if (userRef == null) {
    print("Debug: User reference is null");
    return "User reference is null";
  }

  try {
    // Step 1: Query offersForMe for periodicOfferExpiry with expiryDate within 48 hours
    final now = DateTime.now();
    final fortyEightHoursLater = now.add(Duration(hours: 48));

    print(
        "Debug: Querying offersForMe for periodicOfferExpiry within 48 hours...");
    final offersForExpiry = await FirebaseFirestore.instance
        .collection("offersForMe")
        .where("userRef", isEqualTo: userRef)
        .where("type", isEqualTo: "periodicOfferExpiry")
        .where("expiryDate", isGreaterThanOrEqualTo: Timestamp.fromDate(now))
        .where("expiryDate",
            isLessThanOrEqualTo: Timestamp.fromDate(fortyEightHoursLater))
        .get();

    print(
        "Debug: Found ${offersForExpiry.docs.length} offers for userRef: ${userRef.id}");

    for (final offer in offersForExpiry.docs) {
      final offerData = offer.data();
      final expiryDate = (offerData['expiryDate'] as Timestamp).toDate();

      // Calculate hours left
      final hoursLeft = expiryDate.difference(now).inHours;

      print(
          "Debug: Checking notification for offer with expiryDate: $expiryDate and hoursLeft: $hoursLeft");

      // Step 2: Check for existing notification within the past 24 hours
      final twentyFourHoursAgo = now.subtract(Duration(hours: 24));

      final existingNotifications = await FirebaseFirestore.instance
          .collection("Notification")
          .where("forUserRef", isEqualTo: userRef)
          .where("type", isEqualTo: "periodicOfferExpiry")
          .where("creationDate",
              isGreaterThanOrEqualTo: Timestamp.fromDate(twentyFourHoursAgo))
          .get();

      print(
          "Debug: Found ${existingNotifications.docs.length} existing notifications for this type");

      if (existingNotifications.docs.isEmpty) {
        // Step 3: Create a new notification
        print("Debug: No notification found. Creating a new notification...");
        await FirebaseFirestore.instance.collection("Notification").add({
          "forUserRef": userRef,
          "type": "periodicOfferExpiry",
          "creationDate": Timestamp.fromDate(now),
          "expiryDate": Timestamp.fromDate(expiryDate),
          "hoursLeft": hoursLeft,
          "isSeen": false,
        });

        print(
            "Debug: Notification created successfully for offer with expiryDate: $expiryDate");
      } else {
        print("Debug: Notification already exists for this offer.");
      }
    }

    return "Processing completed";
  } catch (e) {
    print("Error: $e");
    return "Error: $e";
  }
}
