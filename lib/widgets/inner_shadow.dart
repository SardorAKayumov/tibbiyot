import 'dart:ui';

import 'package:flutter/material.dart';

class InnerShadow extends StatelessWidget {
  final Color color;
  final double blur;
  final Offset offset;
  final Widget child;

  const InnerShadow({
    super.key,
    this.color = Colors.black,
    this.blur = 5,
    this.offset = const Offset(2, 2),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: CustomPaint(
            painter: _InnerShadowPainter(color, blur, offset),
          ),
        ),
      ],
    );
  }
}

class _InnerShadowPainter extends CustomPainter {
  final Color color;
  final double blur;
  final Offset offset;

  _InnerShadowPainter(this.color, this.blur, this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..blendMode = BlendMode.dstOut
      ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur);

    canvas.saveLayer(rect, Paint());
    canvas.drawRect(rect, Paint()..color = color);
    canvas.translate(offset.dx, offset.dy);
    canvas.drawRect(rect, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
