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

Future<String> createOffersForMeQRCodesOld(
    DocumentReference? userRef, List<QRCodesRecord>? qrCodes) async {
  if (qrCodes == null || qrCodes.isEmpty) {
    return 'No QR Codes were provided.';
  }
  if (userRef == null) {
    return 'User reference is missing.';
  }

  int totalOffersCreated = 0;
  int totalQRCodesProcessed = 0;

  try {
    for (final qr in qrCodes) {
      final DocumentReference qrCodeRef = qr.reference; // Get QR Code reference
      final DocumentReference eateryRef = qr.eateryRef as DocumentReference;
      // Get eatery reference

      print("Processing QR Code: $qrCodeRef for Eatery: $eateryRef");

      // Check existing active offers for this QR Code
      final existingOffersQuery = await FirebaseFirestore.instance
          .collection('offersForMe')
          .where('userRef', isEqualTo: userRef)
          .where('qrCodeRef',
              isEqualTo: qrCodeRef) // Use qrCodeRef instead of eateryRef
          .where('status', isEqualTo: 'Active')
          .where('isWelcomeOffer', isEqualTo: false)
          .get();

      print('Existing offers for QR Code: ${existingOffersQuery.docs.length}');

      if (existingOffersQuery.docs.length >= 2) {
        continue; // Skip if max offers already exist
      }

      final offersFormulaQuery = await FirebaseFirestore.instance
          .collection('Offers_Formula')
          .orderBy('probability', descending: true)
          .get();

      if (offersFormulaQuery.docs.isEmpty) {
        return 'No formulas found in the Offers_Formula collection.';
      }

      int createdCount = existingOffersQuery.docs.length;
      totalQRCodesProcessed++;

      for (final formulaDoc in offersFormulaQuery.docs) {
        if (createdCount >= 2) break;

        final level = formulaDoc.get('level');

        final offersQuery = await FirebaseFirestore.instance
            .collection('Offers')
            .where('offerLevel', isEqualTo: level)
            .where('eateryRef',
                isEqualTo: eateryRef) // Keep filtering by eatery
            .get();

        List<QueryDocumentSnapshot> offerDocs = offersQuery.docs.toList();
        offerDocs.shuffle();

        print('Total offers found for eatery: ${offerDocs.length}');
        print('Shuffled offers: ${offerDocs.map((doc) => doc.id).toList()}');

        for (final offerDoc in offerDocs) {
          if (createdCount >= 2) break;

          print('Checking offer: ${offerDoc.id}');

          // Check for duplicate offers using qrCodeRef
          final duplicateCheckQuery = await FirebaseFirestore.instance
              .collection('offersForMe')
              .where('userRef', isEqualTo: userRef)
              .where('qrCodeRef', isEqualTo: qrCodeRef) // Use qrCodeRef here
              .where('offerRef', isEqualTo: offerDoc.reference)
              .where('status', isEqualTo: 'Active')
              .where('isWelcomeOffer', isEqualTo: false)
              .get();

          if (duplicateCheckQuery.docs.isNotEmpty) {
            print('Skipping duplicate offer: ${offerDoc.id}');
            continue;
          }

          // Create a new offer including qrCodeRef
          await FirebaseFirestore.instance.collection('offersForMe').add({
            'userRef': userRef,
            'eateryRef': eateryRef,
            'qrCodeRef': qrCodeRef, // Add qrCodeRef here
            'offerRef': offerDoc.reference,
            'status': 'Active',
            'isWelcomeOffer': false,
            'createdAt': FieldValue.serverTimestamp(),
            'expiryDate':
                Timestamp.fromDate(DateTime.now().add(Duration(days: 7))),
            'currentBoostCycleNumber': qr.currentBoostCycle,
            'boostCycleRef': qr.currentBoostCycleRef,
          });

          // Update the QR Code's offersNextGenerationDate
          await qrCodeRef.update({
            'offersNextGenerationDate':
                Timestamp.fromDate(DateTime.now().add(Duration(days: 7))),
          });

          createdCount++;
          totalOffersCreated++;

          print('Offer created successfully: ${offerDoc.id}');
        }
      }
    }

    if (totalOffersCreated > 0) {
      return 'Successfully created $totalOffersCreated offers for $totalQRCodesProcessed QR Codes.';
    } else {
      return 'No new offers were created. Either there were no matching offers or the user already has the maximum allowed offers.';
    }
  } catch (error) {
    return 'An error occurred while creating offers: ${error.toString()}';
  }
}
