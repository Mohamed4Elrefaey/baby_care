import 'package:baby_care/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class BookDoctorContainer extends StatelessWidget {
  const BookDoctorContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: 16.all,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),

        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: child,
    );
  }
}
