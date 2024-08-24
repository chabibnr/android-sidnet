import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.notification_important_outlined,
          color: Colors.grey.shade600,
          size: 80,
        ),
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 24,
            color: Colors.grey.shade400,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.nunito(
            color: Colors.grey.shade400,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
