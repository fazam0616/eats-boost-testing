// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class Test extends StatefulWidget {
  const Test({
    super.key,
    required this.width,
    required this.height,
    this.onClicked,
  });

  final double width;
  final double height;
  final VoidCallback? onClicked; // ✅ Fixed syntax error

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  void _handleClick() {
    print("Button Clicked");
    if (widget.onClicked != null) {
      widget.onClicked!(); // ✅ Fixed null safety issue
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleClick, // ✅ Changed to onTap (Use onLongPress if needed)
      child: Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          "Click Me",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
