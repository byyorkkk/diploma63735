import 'dart:ui';

import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:timetable/timetable.dart';

class TimelineNowIndicatorShape extends NowIndicatorShape {
  const TimelineNowIndicatorShape({
    required this.backgroundColor,
    this.radius = 8,
  });

  final double radius;
  final Color backgroundColor;

  @override
  void paint(
    Canvas canvas,
    Size size,
    double dateStartOffset,
    double dateEndOffset,
    double timeOffset,
  ) {
    final outerCirclePaint = Paint()
      ..shader = ADGradients.red.createShader(Rect.largest);
    final backgroundPaint = Paint()..color = backgroundColor;

    canvas
      // Draw initially a rectangle to cover that straight line of the indicator
      // behind the circle (few pixels because of circle radius)
      ..drawRect(
        Rect.fromCenter(
          center: Offset(radius, timeOffset),
          width: radius,
          height: radius,
        ),
        backgroundPaint,
      )
      ..drawCircle(
        Offset(radius, timeOffset),
        radius,
        outerCirclePaint,
      )
      ..drawCircle(
        Offset(radius, timeOffset),
        radius / 2,
        backgroundPaint,
      );
  }

  @override
  TimelineNowIndicatorShape copyWith({Color? color, double? radius}) {
    return TimelineNowIndicatorShape(
      radius: radius ?? this.radius,
      backgroundColor: backgroundColor,
    );
  }

  @override
  int get hashCode => Object.hash(radius, backgroundColor);

  @override
  bool operator ==(Object other) {
    return other is TimelineNowIndicatorShape &&
        radius == other.radius &&
        backgroundColor == other.backgroundColor;
  }
}
