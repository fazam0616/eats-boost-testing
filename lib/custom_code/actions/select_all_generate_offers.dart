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

Future<List<QRCodesRecord>> selectAllGenerateOffers(
    DocumentReference? userRef) async {
  if (userRef == null) {
    print("UserRef is null. Returning empty list.");
    return [];
  }

  try {
    final qrCodesQuery = await FirebaseFirestore.instance
        .collection("QR_Codes")
        .where("userRef", isEqualTo: userRef)
        .get();

    print("QR Codes Found: ${qrCodesQuery.docs.length}");

    List<QRCodesRecord> qrList = [];

    for (final qr in qrCodesQuery.docs) {
      final eateryRef = qr["eateryRef"] as DocumentReference?;
      if (eateryRef == null) {
        print("Skipping QR Code ${qr.id}: eateryRef is null.");
        continue;
      }

      final eaterySnapshot = await eateryRef.get();
      if (!eaterySnapshot.exists) {
        print("Skipping QR Code ${qr.id}: eatery document does not exist.");
        continue;
      }
      print(
          "Current Iteration is for Eatery ID: Name: ${eaterySnapshot['name']},  ${eaterySnapshot.id}");

      final DateTime? offersNextGenerationDate =
          (qr["offersNextGenerationDate"] as Timestamp?)?.toDate();
      if (offersNextGenerationDate != null &&
          DateTime.now().isBefore(offersNextGenerationDate)) {
        print(
            "Skipping QR Code ${qr.id}: offersNextGenerationDate (${offersNextGenerationDate.toIso8601String()}) is in the future.");
        continue;
      }

      final DateTime? qrBoostCycleEndDate =
          (qr["boostCycleEndDate"] as Timestamp?)?.toDate();
      if (qrBoostCycleEndDate != null &&
          DateTime.now().isAfter(qrBoostCycleEndDate)) {
        print(
            "Skipping QR Code ${qr.id}: boostCycleEndDate (${qrBoostCycleEndDate.toIso8601String()}) has already passed.");
        continue;
      }

      final visitsSnapshot = await FirebaseFirestore.instance
          .collection("Visits")
          .where("userRef", isEqualTo: userRef)
          .where("status", isEqualTo: "Approved")
          .where("qrCodeRef", isEqualTo: qr.reference)
          .where("boostCycleRef", isNull: false)
          .get();

      final requiredVisits = eaterySnapshot["requiredVisits"] ?? 0;
      if (visitsSnapshot.docs.length < requiredVisits) {
        print(
            "Skipping QR Code ${qr.id}: only ${visitsSnapshot.docs.length} visits found, but ${requiredVisits} required.");
        continue;
      }

      print("Adding QR Code ${qr.id} to the list.");
      qrList.add(QRCodesRecord.fromSnapshot(qr));
    }

    print("Final QR List Size: ${qrList.length}");
    return qrList;
  } catch (e, s) {
    print("Error in selectAllGenerateOffersQrCode: $e");
    print("Stack Trace: $s");
    return [];
  }
}
