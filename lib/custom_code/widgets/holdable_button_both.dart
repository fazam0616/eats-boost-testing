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

import 'package:flutter/services.dart'; // Import for HapticFeedback
import 'package:vibration/vibration.dart';
import 'dart:async'; // Import for Timer
import 'dart:io' show Platform;

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

  Timer? _hapticTimer; // Timer for periodic haptics (iOS)
  Timer? _vibrationTimer; // Timer for vibration (Android)

  // --- Constants ---
  final int _holdDurationMs = 1500; // Total hold duration
  final int _progressSteps = 100; // Number of steps for progress animation
  final Duration _feedbackInterval =
      Duration(milliseconds: 100); // How often to trigger feedback

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
      progress = 0.0; // Reset progress if starting again
    });

    _startFeedback(); // Start platform-specific feedback
    _runProgressAnimation(); // Start visual progress
  }

  Future<void> _runProgressAnimation() async {
    final int stepDuration = _holdDurationMs ~/ _progressSteps;

    for (int i = 0; i <= _progressSteps; i++) {
      // Check if hold was cancelled *before* the delay
      if (!isHolding) {
        _resetState();
        return;
      }

      await Future.delayed(Duration(milliseconds: stepDuration));

      // Check if hold was cancelled *during* the delay
      if (!mounted || !isHolding) {
        _resetState();
        return;
      }

      // Update progress
      setState(() => progress = i / _progressSteps);

      // Check for completion
      if (progress >= 1.0) {
        if (!isComplete) {
          widget.onHoldComplete();
          setState(() {
            isComplete = true;
            _isRunning = false;
            isHolding = false;
          });
          _stopFeedback(); // Stop feedback explicitly on completion
          _startBlinkingEffect();
        }
        return;
      }
    }
    _resetState();
  }

  void _cancelHold() {
    if (isHolding && !isComplete) {
      _resetState();
    }
  }

  void _resetState() {
    if (mounted) {
      setState(() {
        isHolding = false;
        progress = 0.0;
        _isRunning = false;
      });
    }
    _stopFeedback();
  }

  // --- Platform-Specific Feedback Logic ---
  void _startFeedback() {
    if (Platform.isIOS) {
      _startHapticFeedback();
    } else {
      _startVibration();
    }
  }

  void _stopFeedback() {
    if (Platform.isIOS) {
      _stopHapticFeedback();
    } else {
      _stopVibration();
    }
  }

  // iOS Haptic Feedback
  void _startHapticFeedback() {
    _stopHapticFeedback();
    if (isHolding && !isComplete) {
      HapticFeedback.lightImpact();
      _hapticTimer = Timer.periodic(_feedbackInterval, (timer) {
        if (isHolding && !isComplete && mounted) {
          HapticFeedback.lightImpact();
        } else {
          timer.cancel();
        }
      });
    }
  }

  void _stopHapticFeedback() {
    _hapticTimer?.cancel();
    _hapticTimer = null;
  }

  // Android Vibration
  void _startVibration() async {
    _stopVibration();
    if (isHolding && !isComplete) {
      if (await Vibration.hasVibrator() ?? false) {
        Vibration.vibrate(pattern: [0, 10, 40], repeat: 1);
        _vibrationTimer = Timer.periodic(_feedbackInterval, (timer) async {
          if (isHolding && !isComplete && mounted) {
            if (await Vibration.hasVibrator() ?? false) {
              Vibration.vibrate(pattern: [0, 10, 40], repeat: 1);
            }
          } else {
            timer.cancel();
          }
        });
      }
    }
  }

  void _stopVibration() {
    _vibrationTimer?.cancel();
    _vibrationTimer = null;
    Vibration.cancel();
  }
  // --- End Platform-Specific Feedback Logic ---

  void _startBlinkingEffect() {
    _blinkCount = 0;
    _blinkController.forward();
  }

  @override
  void dispose() {
    _blinkController.dispose();
    _stopFeedback();
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
            height: widget.isWelcomeOffer ? 320 : 250,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: (progress > 0.0 || isComplete) ? 0.0 : 1.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.isWelcomeOffer)
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "${widget.eateryName ?? 'An Eatery'} Has a Welcome Offerrrr For you! 🎉",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            if (widget.eateryLogo != null &&
                                widget.eateryLogo!.isNotEmpty)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network(
                                  widget.eateryLogo!,
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                          width: 120,
                                          height: 120,
                                          color: Colors.grey[300],
                                          child: Icon(Icons.storefront,
                                              size: 50,
                                              color: Colors.grey[600])),
                                ),
                              )
                            else
                              Container(
                                  width: 0,
                                  height: 0,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  child: Icon(Icons.storefront,
                                      size: 50, color: Colors.grey[600])),
                            SizedBox(height: 30),
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          widget.isWelcomeOffer
                              ? "Hold The Button Below To Generate Your Welcome Offer!"
                              : "Hold The Button Below To Generate Your Offers!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      if (!widget.isWelcomeOffer)
                        Column(
                          children: [
                            SizedBox(height: 20),
                            Image.network(
                              "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eats-boost-my0f61/assets/xfimcv9ljstq/3146573.png",
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                    ],
                  ),
                ),
                if (progress > 0.0 || isComplete)
                  FadeTransition(
                    opacity: _blinkCount < 3 && isComplete
                        ? _blinkController
                        : AlwaysStoppedAnimation(progress > 0.0 ? 1.0 : 0.0),
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
                        alignment: Alignment.centerLeft,
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return AnimatedContainer(
                                duration: Duration(milliseconds: 100),
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
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "Generating offers for you...",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
          AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: !isComplete ? 1.0 : 0.0,
            child: IgnorePointer(
              ignoring: isComplete,
              child: GestureDetector(
                onLongPress: _startHold,
                onLongPressUp: _cancelHold,
                child: Image.network(
                  "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eats-boost-my0f61/assets/2sjikguqgbu6/Group_1171275438.png",
                  width: 85,
                  height: 85,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
