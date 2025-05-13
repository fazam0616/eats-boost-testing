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

Future<List<QRCodesRecord>> selectAllGenerateOffersQrCode(
    DocumentReference? userRef) async {
  if (userRef == null) return [];

  try {
    final qrCodesQuery = await FirebaseFirestore.instance
        .collection("QR_Codes")
        .where("userRef", isEqualTo: userRef)
        .get();

    print("QR Codes Found: ${qrCodesQuery.docs.length}");

    List<QRCodesRecord> qrList = [];

    for (final qr in qrCodesQuery.docs) {
      final DocumentReference eateryRef = qr["eateryRef"];
      final DocumentSnapshot eaterySnapshot = await eateryRef.get();

      print("Eatery is: ${eaterySnapshot.reference}");

      // Check if current datetime is before offersNextGenerationDate
      final DateTime? offersNextGenerationDate =
          qr["offersNextGenerationDate"]?.toDate();
      if (offersNextGenerationDate != null &&
          DateTime.now().isBefore(offersNextGenerationDate)) {
        continue;
      }

      final visitsSnapshot = await FirebaseFirestore.instance
          .collection("Visits")
          .where("userRef", isEqualTo: userRef)
          .where("status", isEqualTo: "Approved")
          .where("eateryRef", isEqualTo: eateryRef)
          .get();

      final offersSnapshot = await FirebaseFirestore.instance
          .collection("offersForMe")
          .where("userRef", isEqualTo: userRef)
          .where("qrCodeRef", isEqualTo: qr.reference)
          .where("status", isEqualTo: "Active")
          .get();

      final requiredVisits = eaterySnapshot["requiredVisits"] ?? 0;
      if (visitsSnapshot.docs.length < requiredVisits) {
        continue;
      }

      if (offersSnapshot.docs.isNotEmpty) {
        continue;
      }

      // Add this QR code to the list
      qrList.add(QRCodesRecord.fromSnapshot(qr));
    }

    return qrList;
  } catch (e, s) {
    print("Error in selectAllGenerateOffersQrCode: $e");
    print("Stack Trace: $s");
    return [];
  }
}
