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

import 'dart:math'; // Import the dart:math library for Random

import 'dart:math';

Future<String> createWelcomeOfferForMeQrCode(
  QRCodesRecord qrCode,
  DocumentReference userRef,
) async {
  try {
    final eatery =
        qrCode.eateryRef; // Use .eateryRef to access eatery reference
    print("Eatery Ref Found: $eatery");

    // Fetch offers with level 3 and active status for the given eatery
    final offersQuery = await FirebaseFirestore.instance
        .collection('Offers')
        .where('offerLevel', isEqualTo: 3)
        .where('eateryRef', isEqualTo: eatery)
        .where('status', isEqualTo: 'active') // Only include active offers
        .get();

    // If no offers found, return a message
    if (offersQuery.docs.isEmpty) {
      return 'No level 3 offers found for this eatery.';
    }

    print("Total offers found: ${offersQuery.docs.length}");

    // Select a random offer
    final random = Random();
    final randomIndex = random.nextInt(offersQuery.docs.length);
    final offerDoc = offersQuery.docs[randomIndex];

    // Check if a welcome offer already exists for this qrCodeRef
    final duplicateCheckQuery = await FirebaseFirestore.instance
        .collection('offersForMe')
        .where('userRef', isEqualTo: userRef)
        .where('qrCodeRef', isEqualTo: qrCode.reference)
        .where('isWelcomeOffer', isEqualTo: true)
        .get();

    if (duplicateCheckQuery.docs.isNotEmpty) {
      return 'Welcome offer already exists for this QR code.';
    }

    // Create a new entry in OffersForMe with qrCodeRef
    await FirebaseFirestore.instance.collection('offersForMe').add({
      'userRef': userRef,
      'qrCodeRef': qrCode.reference, // Added qrCodeRef
      'eateryRef': eatery,
      'offerRef': offerDoc.reference,
      'status': 'Active',
      'isWelcomeOffer': true, // This is a welcome offer
      'createdAt': FieldValue.serverTimestamp(),
      'expiryDate': Timestamp.fromDate(DateTime.now().add(Duration(days: 7))),
    });

    return 'Welcome offer created successfully!';
  } catch (error) {
    return 'An error occurred while creating the welcome offer: ${error.toString()}';
  }
}
