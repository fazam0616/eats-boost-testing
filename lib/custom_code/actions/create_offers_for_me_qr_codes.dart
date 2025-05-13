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

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> createOffersForMeQrCodes(
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
      final DocumentReference qrCodeRef = qr.reference;
      final DocumentReference eateryRef = qr.eateryRef as DocumentReference;

      print("Processing QR Code: $qrCodeRef for Eatery: $eateryRef");

      final existingOffersQuery = await FirebaseFirestore.instance
          .collection('offersForMe')
          .where('userRef', isEqualTo: userRef)
          .where('qrCodeRef', isEqualTo: qrCodeRef)
          .where('status', isEqualTo: 'Active')
          .where('isWelcomeOffer', isEqualTo: false)
          .get();

      print('Existing offers for QR Code: ${existingOffersQuery.docs.length}');

      if (existingOffersQuery.docs.length >= 2) {
        continue; // Skip if already has 2 active offers
      }

      final offersFormulaQuery =
          await FirebaseFirestore.instance.collection('Offers_Formula').get();

      if (offersFormulaQuery.docs.isEmpty) {
        return 'No formulas found in the Offers_Formula collection.';
      }

      List<int> levels = [];
      List<double> weights = [];
      for (final formulaDoc in offersFormulaQuery.docs) {
        final level = formulaDoc.get('level');
        final probability = formulaDoc.get('probability');
        if (level != null && probability != null) {
          levels.add(level);
          weights.add(probability.toDouble());
        }
      }
      if (levels.isEmpty) {
        return 'No valid formulas found in the Offers_Formula collection.';
      }

      totalQRCodesProcessed++;

      int level1 = weightedRandomChoice(levels, weights);
      int level2 = weightedRandomChoice(levels, weights);
      print("Selected levels: $level1, $level2");

      Set<DocumentReference> selectedMenuItems = {};
      int offersCreated = existingOffersQuery.docs.length;

      // Create only one offer per level
      if (offersCreated < 2) {
        offersCreated = await createOfferForLevel(level1, eateryRef, qrCodeRef,
            userRef, selectedMenuItems, offersCreated, totalOffersCreated);
      }

      if (offersCreated < 2) {
        offersCreated = await createOfferForLevel(level2, eateryRef, qrCodeRef,
            userRef, selectedMenuItems, offersCreated, totalOffersCreated);
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

Future<int> createOfferForLevel(
    int level,
    DocumentReference eateryRef,
    DocumentReference qrCodeRef,
    DocumentReference userRef,
    Set<DocumentReference> selectedMenuItems,
    int offersCreated,
    int totalOffersCreated) async {
  if (offersCreated >= 2) return offersCreated; // Prevents creating more than 2

  final offersQuery = await FirebaseFirestore.instance
      .collection('Offers')
      .where('offerLevel', isEqualTo: level)
      .where('eateryRef', isEqualTo: eateryRef)
      .where('status', isEqualTo: 'active') // Only fetch active offers
      .get();
  List<QueryDocumentSnapshot> offerDocs = offersQuery.docs.toList();
  offerDocs.shuffle(); // Randomize selection

  print('[${offerDocs.length}] offers fetched for level [$level].');

  for (final offerDoc in offerDocs) {
    if (offersCreated >= 2) break; // Stop if 2 offers are already created

    print('Checking offer: ${offerDoc.id}');

    final duplicateCheckQuery = await FirebaseFirestore.instance
        .collection('offersForMe')
        .where('userRef', isEqualTo: userRef)
        .where('qrCodeRef', isEqualTo: qrCodeRef)
        .where('offerRef', isEqualTo: offerDoc.reference)
        .where('status', isEqualTo: 'Active')
        .where('isWelcomeOffer', isEqualTo: false)
        .get();

    if (duplicateCheckQuery.docs.isNotEmpty) {
      print('Skipping duplicate offer: ${offerDoc.id}');
      continue;
    }

    final DocumentReference? menuItemRef = offerDoc.get('menuItemRef');
    if (menuItemRef != null && selectedMenuItems.contains(menuItemRef)) {
      print(
          'Skipping offer ${offerDoc.id} because menuItemRef $menuItemRef is already used.');
      continue;
    }

    await FirebaseFirestore.instance.collection('offersForMe').add({
      'userRef': userRef,
      'eateryRef': eateryRef,
      'qrCodeRef': qrCodeRef,
      'offerRef': offerDoc.reference,
      'status': 'Active',
      'isWelcomeOffer': false,
      'createdAt': FieldValue.serverTimestamp(),
      'expiryDate': Timestamp.fromDate(DateTime.now().add(Duration(days: 7))),
      'currentBoostCycleNumber': 1,
    });

    print('Offer created successfully: ${offerDoc.id}');
    print('Debug: This is an offer created for QR Code $qrCodeRef');
    print('Level [$level] created.');

    await qrCodeRef.update({
      'offersNextGenerationDate':
          Timestamp.fromDate(DateTime.now().add(Duration(days: 7))),
    });

    offersCreated++; // Update count of created offers
    totalOffersCreated++;
    if (menuItemRef != null)
      selectedMenuItems.add(menuItemRef); // Track used menu items

    break; // Ensure only one offer is created per function call
  }

  return offersCreated;
}

int weightedRandomChoice(List<int> levels, List<double> weights) {
  double totalWeight = weights.reduce((a, b) => a + b);
  double randomValue = Random().nextDouble() * totalWeight;
  for (int i = 0; i < levels.length; i++) {
    if (randomValue < weights[i]) {
      return levels[i];
    }
    randomValue -= weights[i];
  }
  return levels.last;
}
