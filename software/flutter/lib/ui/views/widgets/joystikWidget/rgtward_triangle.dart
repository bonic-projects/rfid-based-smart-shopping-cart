import 'package:flutter/material.dart';
import 'package:shopmate/ui/common/app_colors.dart';

class RightwardTriangle extends StatelessWidget {
  final void Function() onTap;
  const RightwardTriangle({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Stack(
        children: [
          ClipPath(
            clipper: _Triangle(),
            child: Container(
              decoration: const BoxDecoration(color: kcPrimaryColor),
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class _Triangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(0, size.height);
    path.close();
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
