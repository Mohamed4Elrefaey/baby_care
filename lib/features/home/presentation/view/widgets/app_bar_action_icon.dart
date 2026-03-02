import 'package:baby_care/core/widgets/circle_avatar_linear_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarActionIcon extends StatelessWidget {
  const AppBarActionIcon({
    super.key,
    required this.svgIconPath,
    required this.onTab,
  });
  final String svgIconPath;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: CircleAvatarLinearColor(
        linearGradient: LinearGradient(
          colors: [
            Color(0xFF47B2B9).withOpacity(0.6),
            Color(0xFF70A97C).withOpacity(0.6),
          ],
        ),
        radius: 16,
        child: SvgPicture.asset(svgIconPath, width: 20, height: 20),
      ),
    );
  }
}
