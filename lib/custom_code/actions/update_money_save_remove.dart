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

Future updateMoneySaveRemove(DocumentReference? qrCodeRef) async {
  if (qrCodeRef == null) {
    print("Invalid input: qrCodeRef is null");
    return;
  }

  try {
    print("Searching for MoneySaved document with qrCodeRef: ${qrCodeRef.id}");

    // Query the MoneySaved collection to find the document
    final moneySavedQuery = await FirebaseFirestore.instance
        .collection("MoneySaved")
        .where("qrCodeRef", isEqualTo: qrCodeRef)
        .limit(1)
        .get();

    if (moneySavedQuery.docs.isEmpty) {
      print("No MoneySaved document found for qrCodeRef: ${qrCodeRef.id}");
      return;
    }

    final docId = moneySavedQuery.docs.first.id;

    // Update the document's status to "Removed"
    await FirebaseFirestore.instance
        .collection("MoneySaved")
        .doc(docId)
        .update({
      "status": "Removed",
      "updatedAt": FieldValue.serverTimestamp(),
    });

    print("MoneySaved document status updated to 'Removed'.");
  } catch (e) {
    print("Error in updateMoneySaveRemove: $e");
  }
}
