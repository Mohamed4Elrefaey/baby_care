import 'package:flutter/material.dart';

class ChatBotInputButton extends StatelessWidget {
  const ChatBotInputButton({
    super.key,
    required this.color,
    required this.onTap,
    required this.child,
  });
  final Color color;
  final VoidCallback onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.02),
              blurRadius: 5.25,
              offset: const Offset(0, 0),
            ),
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.08),
              blurRadius: 3.5,
              offset: const Offset(0, 1.75),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
