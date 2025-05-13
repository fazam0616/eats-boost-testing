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

import '/backend/schema/structs/index.dart'; // Import FlutterFlow-generated structs
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<MoneySavedStruct>> moneySaved(DocumentReference? userRef) async {
  try {
    print("Fetching redeemed offers for user: ${userRef?.id}");

    // Fetch all redeemed offers for the user
    final offersRedeemedSnapshot = await FirebaseFirestore.instance
        .collection("offersForMe")
        .where("status", isEqualTo: "Redeemed")
        .where("userRef", isEqualTo: userRef)
        .get();

    print("Total redeemed offers found: ${offersRedeemedSnapshot.docs.length}");

    // Group offers by eateryRef
    final Map<DocumentReference, List<DocumentReference>> groupedOffers = {};
    for (var doc in offersRedeemedSnapshot.docs) {
      final eateryRef = doc["eateryRef"] as DocumentReference;
      final offerRef = doc["offerRef"] as DocumentReference;

      print(
          "Processing offer: ${doc.id}, EateryRef: ${eateryRef.id}, OfferRef: ${offerRef.id}");

      // Verify if the offer document exists
      final offerSnapshot = await offerRef.get();

      if (!offerSnapshot.exists) {
        print(
            "Offer does not exist: ${offerRef.id}, deleting reference from offersForMe...");

        // Delete the invalid reference from Firestore
        await FirebaseFirestore.instance
            .collection("offersForMe")
            .doc(doc.id)
            .delete();
        continue; // Skip this invalid offer
      }

      if (!groupedOffers.containsKey(eateryRef)) {
        groupedOffers[eateryRef] = [];
      }
      groupedOffers[eateryRef]!.add(offerRef);
    }

    // Calculate total savings for each eatery
    final List<MoneySavedStruct> results = [];
    for (var entry in groupedOffers.entries) {
      final eateryRef = entry.key;
      final offerRefs = entry.value;

      double totalSavings = 0.0;

      // Fetch savings from each valid offerRef
      for (var offerRef in offerRefs) {
        final offerSnapshot = await offerRef.get();

        if (!offerSnapshot.exists) continue; // Double check before accessing

        final savings = offerSnapshot["savings"] as double? ?? 0.0;
        totalSavings += savings;
      }

      // Use FlutterFlow's struct constructor
      results.add(MoneySavedStruct(
        eateryRef: eateryRef,
        moneySaved: totalSavings,
      ));
    }

    return results;
  } catch (e) {
    print("Error occurred: $e");
    return [];
  }
}
