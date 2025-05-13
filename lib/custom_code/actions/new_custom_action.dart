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

import 'package:mime/mime.dart';

Future<String> newCustomAction(FFUploadedFile? providedFile) async {
  // check if the provided file is image or video and return
  if (providedFile == null || providedFile.bytes == null) {
    return "File not provided";
  }

  // Get MIME type using lookupMimeType from the 'mime' package
  String? mimeType = lookupMimeType('', headerBytes: providedFile.bytes);

  if (mimeType == null) {
    return "Unknown file type";
  }

  if (mimeType.startsWith("image")) {
    return "Image";
  } else if (mimeType.startsWith("video")) {
    return "Video";
  } else {
    return "Unknown file type";
  }
}
