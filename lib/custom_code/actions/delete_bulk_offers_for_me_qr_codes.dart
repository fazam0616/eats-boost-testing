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

Future<void> deleteBulkOffersForMeQrCodes(
  DocumentReference? qrCodeRef,
  DocumentReference? userRef,
) async {
  print("Fetching active offers for user: $userRef at eatery: $qrCodeRef");

  final querySnapshot = await FirebaseFirestore.instance
      .collection("offersForMe")
      .where("userRef", isEqualTo: userRef)
      .where("qrCodeRef", isEqualTo: qrCodeRef)
      .where("status", isEqualTo: "Active")
      .get();

  print("Found ${querySnapshot.docs.length} offers to mark as removed");

  for (final doc in querySnapshot.docs) {
    print("Marking offer as removed: ${doc.id}");
    await doc.reference.update({
      'status': 'Removed',
      'removedAt': FieldValue.serverTimestamp(),
    });
  }

  print("All matching active offers have been marked as removed.");
}
