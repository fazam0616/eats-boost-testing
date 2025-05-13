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

import 'dart:math' as math;

Future<double> calculateDistance(
  LatLng? l1,
  LatLng? l2,
) async {
  if (l1 == null || l2 == null) {
    throw ArgumentError("Both LatLng points must be provided.");
  }

  const double earthRadius = 6371000.0; // in meters

  double lat1 = l1.latitude * math.pi / 180.0;
  double lon1 = l1.longitude * math.pi / 180.0;
  double lat2 = l2.latitude * math.pi / 180.0;
  double lon2 = l2.longitude * math.pi / 180.0;

  double dLat = lat2 - lat1;
  double dLon = lon2 - lon1;

  double a = math.pow(math.sin(dLat / 2), 2) +
      math.cos(lat1) * math.cos(lat2) * math.pow(math.sin(dLon / 2), 2);
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  double result = earthRadius * c;

  return double.parse(result.toStringAsFixed(1)); // Keep rounding if needed
}
