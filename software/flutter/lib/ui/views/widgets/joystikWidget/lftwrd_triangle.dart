import 'package:flutter/material.dart';
import 'package:shopmate/ui/common/app_colors.dart';

class LeftwardTriangle extends StatelessWidget {
  final void Function() onTap;
  const LeftwardTriangle({super.key, required this.onTap});

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
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
