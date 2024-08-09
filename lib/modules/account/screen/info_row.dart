part of 'account_screen.dart';

class ProfileInfoRow extends StatelessWidget {
  final String iconPath;
  final String label;
  final String? value;
  final bool showDivider;

  const ProfileInfoRow({
    super.key,
    required this.iconPath,
    required this.label,
    this.value,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 30,
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  value ?? "",
                  style: GoogleFonts.inter(color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
        if (showDivider) Divider(color: Colors.grey.shade300),
        const SizedBox(height: 15),
      ],
    );
  }
}
