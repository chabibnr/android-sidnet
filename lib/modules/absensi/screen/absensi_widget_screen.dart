import 'dart:developer';

import 'package:app/modules/absensi/bloc/absensi_widget/absensi_widget_cubit.dart';
import 'package:app/modules/absensi/screen/absensi_load_screen.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AbsensiWidgetScreen extends StatelessWidget {
  const AbsensiWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 30),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.blue.shade50.withOpacity(0.5)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Absensi Bulan Ini",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333),
                  )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AbsensiLoadScreen()),
                    );
                  },
                  child: Text(
                    "View",
                    style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                      color: ColorSchema.primaryColor.withOpacity(0.7),
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocProvider(
              create: (context) => AbsensiWidgetCubit()..load(),
              child: BlocConsumer<AbsensiWidgetCubit, AbsensiWidgetState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  log("Reload ${state.isLoading}");
                  if (state.isLoading && state.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final data = state.data;
                  if (data != null) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildReports(
                          "Masuk",
                          "${data.masuk}",
                          Colors.lightBlueAccent.shade100.withOpacity(0.25),
                          "assets/icons/icon_svg/sale_service_icon.svg",
                          screenWidth,
                          context,
                        ),
                        buildReports(
                          "Tidak Masuk",
                          "${data.tidakmasuk}",
                          Colors.purple.shade100.withOpacity(0.25),
                          "assets/icons/icon_svg/purchase_service_icon.svg",
                          screenWidth,
                          context,
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: Text('Error'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector buildReports(
    String title,
    String amount,
    Color reportColor,
    reportIcon,
    double screenWidth,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: screenWidth * 0.40,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: reportColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.035,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF333333),
              )),
            ),
            Text.rich(
              TextSpan(
                style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: const Color(0xFF333333),
                )),
                children: [
                  TextSpan(text: amount),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
