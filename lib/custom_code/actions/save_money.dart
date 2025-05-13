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

Future<void> saveMoney(
  DocumentReference? userRef,
  DocumentReference? eateryRef,
  DocumentReference? qrCodeRef,
) async {
  if (qrCodeRef == null || userRef == null || eateryRef == null) {
    print("Invalid input: userRef, eateryRef, or qrCodeRef is null");
    return;
  }

  try {
    print("Fetching redeemed offers for QR Code: ${qrCodeRef.id}");

    // Fetch all offers with Redeemed status and matching qrCodeRef
    final offersSnapshot = await FirebaseFirestore.instance
        .collection("offersForMe")
        .where("status", isEqualTo: "Redeemed")
        .where("qrCodeRef", isEqualTo: qrCodeRef)
        .get();

    print("Total matching redeemed offers: ${offersSnapshot.docs.length}");

    double totalSavings = 0.0;

    for (var doc in offersSnapshot.docs) {
      final offerRef = doc["offerRef"] as DocumentReference;

      final offerSnapshot = await offerRef.get();
      if (!offerSnapshot.exists) {
        print("Invalid offerRef: ${offerRef.id}, skipping...");
        continue;
      }

      final savings = offerSnapshot["savings"] as double? ?? 0.0;
      totalSavings += savings;
    }

    print("Total savings to save: $totalSavings");

    // Reference to the MoneySaved document
    final moneySavedQuery = await FirebaseFirestore.instance
        .collection("MoneySaved")
        .where("qrCodeRef", isEqualTo: qrCodeRef)
        .limit(1)
        .get();

    if (moneySavedQuery.docs.isEmpty) {
      // Create a new entry
      await FirebaseFirestore.instance.collection("MoneySaved").add({
        "qrCodeRef": qrCodeRef,
        "userRef": userRef,
        "eateryRef": eateryRef,
        "moneySaved": totalSavings,
        "status": "Active",
        "updatedAt": FieldValue.serverTimestamp(),
      });
      print("MoneySaved document created.");
    } else {
      // Update existing entry
      final docId = moneySavedQuery.docs.first.id;
      await FirebaseFirestore.instance
          .collection("MoneySaved")
          .doc(docId)
          .update({
        "moneySaved": totalSavings,
        "updatedAt": FieldValue.serverTimestamp(),
      });
      print("MoneySaved document updated.");
    }
  } catch (e) {
    print("Error in saveMoney: $e");
  }
}
