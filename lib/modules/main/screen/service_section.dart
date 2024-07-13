import 'package:app/modules/absensi/screen/absensi_load_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildServices(context, "Absensi", "assets/icons/dashboard/presensi.png", Colors.grey.shade100, Colors.purple, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AbsensiLoadScreen()),
                );
              }),
              buildServices(context, "Cuti", "assets/icons/dashboard/leave.png", Colors.grey.shade100, Colors.green, () {}),
              buildServices(context, "SPL", "assets/icons/dashboard/timesheet.png", Colors.grey.shade100, Colors.blue, () {}),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildServices(context, "Gaji", "assets/icons/dashboard/expense_list.png", Colors.grey.shade100, Colors.red, () {}),
              buildServices(context, "THR", "assets/icons/dashboard/thr.png", Colors.grey.shade100, Colors.cyan, () {}),
              buildServices(context, "Pinjaman", "assets/icons/dashboard/loan.png", Colors.grey.shade100, Colors.teal, () {}),
            ],
          ),
        ],
      ),
    );
  }

  InkWell buildServices(context, String service, String serviceIcon, Color serviceColor, Color serviceImageColor, Function onPressed) {
    return InkWell(
      onTap: () => onPressed(),
      child: Column(
        children: [
          Column(
            children: [
              Stack(alignment: Alignment.center, children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(color: serviceColor, borderRadius: BorderRadius.circular(16)),
                ),
                ImageIcon(
                  AssetImage(
                    serviceIcon,
                  ),
                  color: serviceImageColor,
                  size: 45,
                )
              ]),
              const SizedBox(
                height: 5,
              ),
              Text(
                service.toUpperCase(),
                style: GoogleFonts.nunito(textStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035)),
              )
            ],
          )
        ],
      ),
    );
  }
}
