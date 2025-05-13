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

Future updateOfferIntoExpireByTriedRedeem(DocumentReference? userRef) async {
  try {
    // Fetch the offers where the status is Active, and the offer has been tried for redemption
    print("Fetching offers for user: $userRef");

    final existingOffersQuery = await FirebaseFirestore.instance
        .collection('offersForMe')
        .where('userRef', isEqualTo: userRef)
        .where('status', isEqualTo: 'Active')
        .where('triedRedeem',
            isEqualTo: true) // Assuming triedRedeem is a boolean field
        .get();

    // Check if any offers exist
    if (existingOffersQuery.docs.isEmpty) {
      print("No active offers found for this user.");
      return; // Exit if no offers are found
    }

    print("Found ${existingOffersQuery.docs.length} active offers to update.");

    // Loop through each offer and update the status to 'Expired'
    for (final offer in existingOffersQuery.docs) {
      final offerRef = offer.reference;

      print("Updating offer with ID: ${offer.id} to Expired");

      await offerRef.update({
        'status': 'Expired', // Update the status to 'Expired'
        'expiredReason': 'fifteenSeconds' // Add a reason field
      });

      print("Offer with ID: ${offer.id} updated to Expired successfully.");
    }
  } catch (e) {
    print("Error while updating offers: $e");
  }
}
