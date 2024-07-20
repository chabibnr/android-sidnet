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
        const Icon(
          Icons.notification_important_outlined,
          color: Colors.white,
          size: 80,
        ),
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
