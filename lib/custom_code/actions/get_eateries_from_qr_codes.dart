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

Future<List<EateriesRecord>> getEateriesFromQrCodes(
    List<QRCodesRecord>? qrCodes) async {
  // Initialize an empty list to store eateries
  List<EateriesRecord> eateries = [];

  // Check if qrCodes is null or empty
  if (qrCodes == null || qrCodes.isEmpty) {
    return eateries;
  }

  try {
    // Iterate over each QR code
    for (final qr in qrCodes) {
      // Check if eateryRef is null
      if (qr.eateryRef == null) {
        print("Skipping QR code with null eateryRef");
        continue; // Skip this QR code
      }

      // Fetch the eatery document using the eateryRef from the QR code
      final eaterySnapshot = await qr.eateryRef?.get();

      // Check if the document exists
      if (eaterySnapshot != null && eaterySnapshot.exists) {
        // Convert the document snapshot to an EateriesRecord object
        final eatery = EateriesRecord.fromSnapshot(eaterySnapshot);
        eateries.add(eatery);
      }
    }

    // Return the list of eateries
    return eateries;
  } catch (e, s) {
    // Handle errors
    print("Error: $e");
    print("Stack Trace Error: $s");
    return [];
  }
}
