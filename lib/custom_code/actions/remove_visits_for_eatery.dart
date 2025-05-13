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

Future<String> removeVisitsForEatery(DocumentReference? qrCodeRef) async {
  // Add your function code here!
  try {
    // Step 1: Query all pending visits for the qrCodeRef
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Visits')
        .where('qrCodeRef', isEqualTo: qrCodeRef) // Changed to match qrCodeRef
        .where('status', isEqualTo: 'Pending')
        .get();

    // Debugging: Print how many pending visits were found
    print(
        'Found ${querySnapshot.docs.length} pending visits for this QR code.');

    if (querySnapshot.docs.isEmpty) {
      return 'No pending visits found for this QR code.';
    }

    // Step 2: Loop through and handle each visit
    for (final doc in querySnapshot.docs) {
      final visitData = doc.data(); // Get the full data
      final docRef = doc.reference;

      // Debugging: Print which visit is being moved
      print('Moving visit with ID: ${doc.id} to visits_removed.');

      // Step 3: Copy to visits_removed (auto-created if doesn't exist)
      await FirebaseFirestore.instance
          .collection('visits_removed')
          .add(visitData);

      // Step 4: Delete the original visit
      await docRef.delete();

      // Debugging: Confirm deletion of the visit
      print('Visit with ID: ${doc.id} has been deleted.');
    }

    return 'All pending visits moved to visits_removed and deleted.';
  } catch (error) {
    print('Error while removing visits: $error');
    return 'An error occurred: ${error.toString()}';
  }
}
