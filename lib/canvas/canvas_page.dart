import 'package:flutter/material.dart';

class CanvasPage extends StatefulWidget {
  const CanvasPage({Key? key}) : super(key: key);

  @override
  State<CanvasPage> createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
      ),
      child: CustomPaint(painter: CanvasPage2()),
    );
  }
}

class CanvasPage2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    canvas.drawCircle(Offset.zero, 20, paint);
    //!
    canvas.drawCircle(
        Offset(size.width / 1, size.height / 1), size.width / 5, paint);
    canvas.drawRect(const Offset(30, 30) & const Size(30, 30), paint);

    //!
    final paint2 = Paint();
    paint2.color = Colors.black;
    paint2.strokeWidth = 5;
    //! from height to with
    canvas.drawLine(Offset.zero, Offset(size.width, size.height), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
