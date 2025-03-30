import 'package:flutter/cupertino.dart';

class CustomCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.1, 0); // Sol üstten sağa doğru eğim
    path.lineTo(size.width, size.height * 0.4); // Sağ üstten aşağı
    path.lineTo(size.width, size.height); // Sağ alt
    path.lineTo(0, size.height); // Sol alt
    path.close(); // Şekli kapat
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}