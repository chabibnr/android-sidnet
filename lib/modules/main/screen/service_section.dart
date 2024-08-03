import 'package:app/modules/absensi/screen/absensi_load_screen.dart';
import 'package:app/modules/cuti/screen/cuti_load_screen.dart';
import 'package:app/modules/gaji/screen/gaji_load_screen.dart';
import 'package:app/modules/pinjaman/screen/pinjaman_load_screen.dart';
import 'package:app/modules/spl/screen/spl_load_screen.dart';
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
              buildServices(context, "Cuti", "assets/icons/dashboard/leave.png", Colors.grey.shade100, Colors.green, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CutiLoadScreen()),
                );
              }),
              buildServices(context, "SPL", "assets/icons/dashboard/timesheet.png", Colors.grey.shade100, Colors.blue, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SplLoadScreen()),
                );
              }),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildServices(context, "Gaji", "assets/icons/dashboard/expense_list.png", Colors.grey.shade100, Colors.red, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GajiLoadScreen()),
                );
              }),
              buildServices(context, "THR", "assets/icons/dashboard/thr.png", Colors.grey.shade100, Colors.cyan, () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Fitur tidak tersedia'),
                      content: const SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            //Text('Fitur THR belum tersedia.'),
                            Text('Untuk saat ini fitur THR belum tersedia.'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }),
              buildServices(context, "Pinjaman", "assets/icons/dashboard/loan.png", Colors.grey.shade100, Colors.teal, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PinjamanLoadScreen()),
                );
              }),
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
                  decoration: BoxDecoration(
                    color: serviceColor,
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, serviceImageColor.withOpacity(.4)],
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  child: ImageIcon(
                    AssetImage(
                      serviceIcon,
                    ),
                    color: serviceImageColor,
                    size: 45,
                  ),
                ),
                Positioned(
                  bottom: 9,
                  child: Text(
                    service.toUpperCase(),
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035, fontWeight: FontWeight.bold),
                      color: serviceImageColor,
                    ),
                  ),
                )
              ]),
              const SizedBox(
                height: 5,
              ),
            ],
          )
        ],
      ),
    );
  }
}
