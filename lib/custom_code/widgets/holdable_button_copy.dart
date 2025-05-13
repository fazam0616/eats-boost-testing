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

import 'package:vibration/vibration.dart';
import 'package:flutter/services.dart'; // Import for HapticFeedback

// haptic_feedback: ^0.5.1+1
// import 'package:haptic_feedback/haptic_feedback.dart';

class HoldableButton extends StatefulWidget {
  const HoldableButton({
    super.key,
    required this.width,
    required this.height,
    required this.onHoldComplete,
    this.isWelcomeOffer = false,
    this.eateryName,
    this.eateryLogo,
  });

  final double width;
  final double height;
  final VoidCallback onHoldComplete;
  final bool isWelcomeOffer;
  final String? eateryName;
  final String? eateryLogo;

  @override
  State<HoldableButton> createState() => _HoldableButtonState();
}

class _HoldableButtonState extends State<HoldableButton>
    with SingleTickerProviderStateMixin {
  bool isHolding = false;
  double progress = 0.0;
  bool isComplete = false;
  bool _isRunning = false;
  late AnimationController _blinkController;
  int _blinkCount = 0; // Counter for blinks

  @override
  void initState() {
    super.initState();
    _blinkController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (_blinkCount < 3) {
            _blinkController.reverse();
          } else {
            _blinkController.stop();
            setState(() {}); // Ensure UI updates and keeps text visible
          }
        } else if (status == AnimationStatus.dismissed) {
          _blinkCount++;
          if (_blinkCount < 3) {
            _blinkController.forward();
          } else {
            setState(() {}); // Ensure UI updates after last blink
          }
        }
      });
  }

  void _startHold() {
    if (_isRunning || isComplete) return;

    setState(() {
      isHolding = true;
      _isRunning = true;
    });

    _startVibration(); //VIBRATION
    _runProgressAnimation();
  }

  Future<void> _runProgressAnimation() async {
    const int durationMs = 1500;
    const int steps = 100;
    const int stepDuration = durationMs ~/ steps;

    for (int i = 0; i <= steps; i++) {
      await Future.delayed(Duration(milliseconds: stepDuration));

      if (!isHolding) {
        _stopVibration(); //VIBRATION
        return;
      }

      setState(() => progress = i / steps);

      if (progress >= 1.0) {
        widget.onHoldComplete();
        setState(() {
          isComplete = true;
          _isRunning = false;
        });

        _stopVibration(); //VIBRATION
        _startBlinkingEffect();
        return;
      }
    }
  }

  void _cancelHold() {
    if (isComplete) return;

    setState(() {
      isHolding = false;
      progress = 0.0;
      _isRunning = false;
    });

    _stopVibration(); //VIBRATION
  }

  void _startVibration() async {
    //VIBRATION
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(pattern: [0, 10, 40], repeat: 1); // Repeat once
    }
  }

  void _stopVibration() {
    //VIBRATION
    Vibration.cancel();
  }

  void _startBlinkingEffect() {
    _blinkCount = 0; // Reset counter
    _blinkController.forward();
  }

  @override
  void dispose() {
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: widget.isWelcomeOffer ? 300 : 250, // Dynamic height
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Initial Text Before Progress Starts
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: progress > 0.0 ? 0.0 : 1.0,
                  child: Column(
                    children: [
                      if (widget.isWelcomeOffer)
                        Column(
                          children: [
                            Text(
                              "${widget.eateryName} Has a Welcome Offer For you! 🎉",
                              textAlign: TextAlign.center,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 55),
                            Image.network(
                              widget.eateryLogo!,
                              height: 175,
                              width: 175,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 60),
                          ],
                        ),
                      Text(
                        widget.isWelcomeOffer
                            ? "Hold The Button Below To Generate Your Welcome Offer!"
                            : "Hold The Button Below To Generate Your Offers!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      if (!widget.isWelcomeOffer)
                        Column(
                          children: [
                            SizedBox(height: 80),
                            Image.network(
                              "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eats-boost-my0f61/assets/xfimcv9ljstq/3146573.png",
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                // Progress Bar Container
                if (progress > 0.0 ||
                    isComplete) // Show only when progress starts or is complete
                  FadeTransition(
                    opacity: _blinkCount < 3 && isComplete
                        ? _blinkController
                        : AlwaysStoppedAnimation(1.0),
                    child: Container(
                      width: widget.width * 0.8,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border:
                            Border.all(width: 2, color: Colors.grey.shade300),
                      ),
                      child: Stack(
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Container(
                                width: constraints.maxWidth * progress,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.orange.shade400,
                                      Colors.deepOrange,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                              );
                            },
                          ),
                          if (isComplete)
                            Center(
                              child: Text(
                                "Generating offers for you...",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Hold Button
          AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: progress < 1.0 ? 1.0 : 0.0,
            child: GestureDetector(
              onLongPress: _startHold,
              onLongPressUp: _cancelHold,
              child: Image.network(
                "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eats-boost-my0f61/assets/2sjikguqgbu6/Group_1171275438.png",
                width: 85,
                height: 85,
                fit: BoxFit.cover, // Ensures the image fills the space properly
              ),
            ),
          ),
        ],
      ),
    );
  }
}
