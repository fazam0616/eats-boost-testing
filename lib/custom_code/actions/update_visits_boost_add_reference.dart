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

Future<void> updateVisitsBoostAddReference(QRCodesRecord? qrCode) async {
  if (qrCode == null) {
    print("QR Code is null.");
    return;
  }

  DocumentReference qrRef = qrCode.reference;
  // DateTime boostCycleEndDate = DateTime.now().add(Duration(days: 30));

  try {
    // Query visits where QrCodeRef matches and boostCycleRef is null
    final visitsSnapshot = await FirebaseFirestore.instance
        .collection('Visits')
        .where("qrCodeRef", isEqualTo: qrRef)
        .get();

    print("Visits with qrCode: ${visitsSnapshot.docs.length}");

// Filter manually in Dart
    final filteredVisits = visitsSnapshot.docs.where((doc) =>
        !doc.data().containsKey("boostCycleRef") ||
        doc.get("boostCycleRef") == null);

    print("Filtered Visits Count: ${filteredVisits.length}");

    for (final visit in filteredVisits) {
      await visit.reference.update({
        "boostCycleRef": qrCode.currentBoostCycleRef,
        // "boostCycleEndDate": boostCycleEndDate,
      });
      print("Updated visit: ${visit.id}");
    }
  } catch (error) {
    print("An error occurred while updating visits: $error");
  }
}
