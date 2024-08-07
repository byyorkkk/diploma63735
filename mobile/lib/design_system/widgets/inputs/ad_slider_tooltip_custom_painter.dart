import 'dart:ui' as ui;

import 'package:adhd_project/design_system/ad_design_system.dart';
import 'package:flutter/widgets.dart';

class ADSliderTooltipCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(size.width * 0.03138156, size.height * 0.03546372)
      ..cubicTo(
        0,
        size.height * 0.07092760,
        0,
        size.height * 0.1280056,
        0,
        size.height * 0.2421612,
      )
      ..lineTo(0, size.height * 0.6054040)
      ..cubicTo(
        0,
        size.height * 0.7195600,
        0,
        size.height * 0.7766360,
        size.width * 0.03138156,
        size.height * 0.8121000,
      )
      ..cubicTo(
        size.width * 0.06276281,
        size.height * 0.8475640,
        size.width * 0.1132706,
        size.height * 0.8475640,
        size.width * 0.2142856,
        size.height * 0.8475640,
      )
      ..lineTo(size.width * 0.2740900, size.height * 0.8475640)
      ..cubicTo(
        size.width * 0.3641937,
        size.height * 0.8475640,
        size.width * 0.4486312,
        size.height * 0.8972480,
        size.width * 0.5003031,
        size.height * 0.9806640,
      )
      ..cubicTo(
        size.width * 0.5082875,
        size.height * 0.9935560,
        size.width * 0.5122781,
        size.height,
        size.width * 0.5178563,
        size.height,
      )
      ..cubicTo(
        size.width * 0.5234344,
        size.height,
        size.width * 0.5274281,
        size.height * 0.9935560,
        size.width * 0.5354125,
        size.height * 0.9806640,
      )
      ..cubicTo(
        size.width * 0.5870844,
        size.height * 0.8972480,
        size.width * 0.6715188,
        size.height * 0.8475640,
        size.width * 0.7616250,
        size.height * 0.8475640,
      )
      ..lineTo(size.width * 0.7857156, size.height * 0.8475640)
      ..cubicTo(
        size.width * 0.8867281,
        size.height * 0.8475640,
        size.width * 0.9372375,
        size.height * 0.8475640,
        size.width * 0.9686187,
        size.height * 0.8121000,
      )
      ..cubicTo(
        size.width,
        size.height * 0.7766360,
        size.width,
        size.height * 0.7195600,
        size.width,
        size.height * 0.6054040,
      )
      ..lineTo(size.width, size.height * 0.2421616)
      ..cubicTo(
        size.width,
        size.height * 0.1280056,
        size.width,
        size.height * 0.07092760,
        size.width * 0.9686187,
        size.height * 0.03546372,
      )
      ..cubicTo(
        size.width * 0.9372375,
        0,
        size.width * 0.8867281,
        0,
        size.width * 0.7857156,
        0,
      )
      ..lineTo(size.width * 0.2142856, 0)
      ..cubicTo(
        size.width * 0.1132706,
        0,
        size.width * 0.06276281,
        0,
        size.width * 0.03138156,
        size.height * 0.03546372,
      )
      ..close();

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(size.width, size.height),
        Offset(size.width * -13.37816, size.height * 0.4614080),
        ADGradients.red.colors,
        [0, 1],
      );
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
