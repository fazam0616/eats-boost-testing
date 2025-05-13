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

Future<String> offerPeriodicNotification(DocumentReference? userRef) async {
  if (userRef == null) {
    print("Debug: User reference is null");
    return "User reference is null";
  }

  try {
    // Step 1: Query offersForMe
    print("Debug: Querying offersForMe collection for active offers...");
    final offersForMeFound = await FirebaseFirestore.instance
        .collection("offersForMe")
        .where("userRef", isEqualTo: userRef)
        .where("status", isEqualTo: "Active")
        .get();

    print(
        "Debug: Found ${offersForMeFound.docs.length} active offers for userRef: ${userRef.id}");

    if (offersForMeFound.docs.isNotEmpty) {
      // Step 2: Check for existing notification
      final now = DateTime.now();
      final twentyFourHoursAgo = now.subtract(Duration(hours: 24));

      print(
          "Debug: Checking for existing notifications in the past 24 hours...");
      final existingNotifications = await FirebaseFirestore.instance
          .collection("Notification")
          .where("forUserRef", isEqualTo: userRef)
          .where("type", isEqualTo: "periodicOffer")
          .where("creationDate",
              isGreaterThanOrEqualTo: Timestamp.fromDate(twentyFourHoursAgo))
          .get();

      print(
          "Debug: Found ${existingNotifications.docs.length} existing notifications");

      if (existingNotifications.docs.isEmpty) {
        // Step 3: Create new notification
        print("Debug: No notification found. Creating a new notification...");
        await FirebaseFirestore.instance.collection("Notification").add({
          "forUserRef": userRef,
          "type": "periodicOffer",
          "creationDate": Timestamp.fromDate(now),
          "offersCount": offersForMeFound.docs.length,
          "isSeen": false,
        });

        print("Debug: Notification created successfully");
        return "Notification created successfully";
      } else {
        print("Debug: Notification already exists");
        return "Notification already exists";
      }
    } else {
      print("Debug: No active offers found for userRef: ${userRef.id}");
      return "No active offers found";
    }
  } catch (e) {
    print("Error: $e");
    return "Error: $e";
  }
}
