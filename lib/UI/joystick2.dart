import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;



class Joystick2 extends StatefulWidget {
  const Joystick2({super.key});

  @override
  State<Joystick2> createState() => _Joystick2State();
}

class _Joystick2State extends State<Joystick2> {
  Offset joystickCenter = const Offset(15, 25);
  double outerDiameter = 0; //set at runtime
  double innerDiameter = 0; //set at runtime
  Offset currentDelta = Offset.zero;
  double lastSentAngle = 0;

  void updateDelta(Offset newDelta) {
    // if (kDebugMode) {
    //   print("newDelta:$newDelta");
    // }
    //myAngle = delta.direction;

    if ((newDelta.direction-lastSentAngle).abs()>=math.pi/20 && newDelta.distance>0.01){
      lastSentAngle=newDelta.direction;
      if (kDebugMode) {
        print("update");
      }
    }
    setState(() {
      currentDelta = newDelta;
    });
  }

  void updateDeltaFromDrag(Offset dragPosition) {
    Offset newDelta = (dragPosition - (joystickCenter + Offset(outerDiameter,outerDiameter) / 2))/(outerDiameter/2);
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
    updateDeltaFromDrag(d.localPosition);
  }

  void onDragUpdate(DragUpdateDetails d) {
    updateDeltaFromDrag(d.localPosition);
  }

  void onDragEnd(DragEndDetails d) {
    updateDelta(Offset.zero);
  }
}

void processMouse(PointerEvent details) {
 // Offset pointerOffset = Offset(details.position.dx - (screenSize.width / 2), details.position.dy - (screenSize.height / 2));
  //myAngle = pointerOffset.direction;
}
