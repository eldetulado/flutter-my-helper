import 'package:flutter/material.dart';
import 'dart:math' as Math;

class PainterPage extends StatelessWidget {
  const PainterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Painters')),
      body: ListView(
        children: [
          Container(
            height: 20,
            width: 200,
            color: Colors.red,
            child: CustomPaint(painter: BasicPainter()),
          ),
          Container(
            height: kToolbarHeight * 2,
            color: Colors.white,
            child: CustomPaint(painter: AppBar1()),
          ),
          Container(
            height: kToolbarHeight * 2,
            color: Colors.black,
            child: CustomPaint(painter: AppBar2(color: Colors.red)),
          ),
          Container(
            height: kToolbarHeight + (kToolbarHeight / 2),
            child: ClipPath(
              clipper: AppBar3(),
              child: AppBar(
                title: Text('data'),
                leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              ),
            ),
          ),
          CustomPaint(
            painter: AppBar4(color: Colors.blue),
            child: AppBar(
              title: Text('data'),
              leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class BasicPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 8
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class AppBar1 extends CustomPainter {
  final _height = 0.7;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 8
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.05, size.height * _height,
        size.width * 0.5, size.height * _height);
    path.quadraticBezierTo(
        size.width * 0.95, size.height * _height, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class AppBar2 extends CustomPainter {
  final Color color;

  AppBar2({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 4
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    path.lineTo(0, size.height);

    path.arcTo(
      Rect.fromLTWH(0, size.height * 0.5, size.height, size.height),
      Math.pi,
      Math.pi / 2,
      false,
    );

    path.arcTo(
      Rect.fromLTWH(size.width - size.height, size.height * 0.5, size.height,
          size.height),
      (3 * Math.pi) / 2,
      Math.pi / 2,
      false,
    );

    path.lineTo(size.width, 0);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class AppBar3 extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);

    path.arcTo(
      Rect.fromLTWH(0, size.height * 0.7, size.height * 0.7, size.height * 0.7),
      Math.pi,
      Math.pi / 2,
      false,
    );

    path.arcTo(
      Rect.fromLTWH(size.width - (size.height * 0.7), size.height * 0.7,
          size.height * 0.7, size.height * 0.7),
      (3 * Math.pi) / 2,
      Math.pi / 2,
      false,
    );

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class AppBar4 extends CustomPainter {
  final Color color;

  AppBar4({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    path.lineTo(0, size.height);

    path.arcTo(
      Rect.fromLTWH(0, size.height, size.height, size.height),
      Math.pi,
      Math.pi / 2,
      false,
    );

    path.arcTo(
      Rect.fromLTWH(size.width - size.height, size.height, size.height, size.height),
      (3 * Math.pi) / 2,
      Math.pi / 2,
      false,
    );

    path.lineTo(size.width, 0);

    path.close();

    canvas.drawShadow(path, Colors.grey, 4, false);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
