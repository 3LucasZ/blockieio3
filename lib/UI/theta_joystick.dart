import 'dart:math';
import 'package:blockieio3/socket.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;



class ThetaJoystick extends StatefulWidget {
  const ThetaJoystick({super.key});

  @override
  State<ThetaJoystick> createState() => _ThetaJoystickState();
}

class _ThetaJoystickState extends State<ThetaJoystick> {
  Offset joystickCenter = const Offset(15, 25);
  double outerDiameter = 0; //set at runtime
  double innerDiameter = 0; //set at runtime
  Offset currentDelta = Offset.zero;
  double lastSentAngle = 0;

  void updateDelta(Offset newDelta) {
    //send angle when necessary
    if ((newDelta.direction-lastSentAngle).abs()>=math.pi/20 && newDelta.distance>0.01){
      publish_theta(newDelta.direction);
      lastSentAngle=newDelta.direction;
    }
    //update joystick UI
    setState(() {
      currentDelta = newDelta;
    });
  }

  void updateDeltaFromDragPos(Offset dragPos) {
    Offset newDelta = (dragPos - (joystickCenter + Offset(outerDiameter,outerDiameter) / 2))/(outerDiameter/2);
    updateDelta(
      Offset.fromDirection(
        newDelta.direction,
        min(1, newDelta.distance),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    outerDiameter = screenSize.width / 7;
    innerDiameter = screenSize.width / 14;
    return Positioned(
      right: joystickCenter.dx,
      bottom: joystickCenter.dy,
      child: Container(
        width: outerDiameter,
        height: outerDiameter,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          color: Color(0xcc2B3E47),
          shape: BoxShape.circle,
        ),
        child: GestureDetector(
          onPanStart: onDragStart,
          onPanUpdate: onDragUpdate,
          onPanEnd: onDragEnd,
          child: Center(
            child: Transform.translate(
              offset: currentDelta*outerDiameter/2,
              child: Container(
                width: innerDiameter,
                height: innerDiameter,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  color: Color(0xcc526A77),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onDragStart(DragStartDetails d) {
    updateDeltaFromDragPos(d.localPosition);
  }

  void onDragUpdate(DragUpdateDetails d) {
    updateDeltaFromDragPos(d.localPosition);
  }

  void onDragEnd(DragEndDetails d) {
    updateDelta(Offset.zero);
  }
}

void processMouse(PointerEvent details) {
 // Offset pointerOffset = Offset(details.position.dx - (screenSize.width / 2), details.position.dy - (screenSize.height / 2));
  //myAngle = pointerOffset.direction;
}
