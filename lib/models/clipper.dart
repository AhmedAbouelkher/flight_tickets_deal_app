import 'package:flutter/cupertino.dart';

class MainContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.98);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.85,
        size.width * 0.55, size.height * 0.90);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.95, size.width, size.height * 0.80);
    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
