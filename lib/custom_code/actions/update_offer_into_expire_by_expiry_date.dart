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

import '/backend/backend.dart'; // Automatic FlutterFlow imports

Future<void> updateOfferIntoExpireByExpiryDate(
    DocumentReference? userRef) async {
  try {
    // Fetch the offers where the status is Active and the expiryDate is less than the current date-time
    print("Fetching expired offers for user: $userRef");

    final now = DateTime.now();

    final expiredOffersQuery = await FirebaseFirestore.instance
        .collection('offersForMe')
        .where('userRef', isEqualTo: userRef)
        .where('status', isEqualTo: 'Active')
        .where('expiryDate',
            isLessThan: now) // Check if expiryDate is in the past
        .get();

    // Check if any expired offers exist
    if (expiredOffersQuery.docs.isEmpty) {
      print("No expired offers found for this user.");
      return; // Exit if no expired offers are found
    }

    print("Found ${expiredOffersQuery.docs.length} expired offers to update.");

    // Loop through each expired offer and update the status to 'Expired' with a reason
    for (final offer in expiredOffersQuery.docs) {
      final offerRef = offer.reference;

      print("Updating offer with ID: ${offer.id} to Expired");

      await offerRef.update({
        'status': 'Expired', // Update the status to 'Expired'
        'expiredReason': 'sevenDays' // Add a reason field
      });

      print("Offer with ID: ${offer.id} updated to Expired successfully.");
    }
  } catch (e) {
    print("Error while updating expired offers: $e");
  }
}
