import 'dart:developer';

import 'package:app/config/color_config.dart';
import 'package:app/modules/absensi/bloc/absensi_widget/absensi_widget_cubit.dart';
import 'package:app/modules/main/screen/header_section.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AbsensiWidgetScreen extends StatelessWidget {
  const AbsensiWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AbsensiWidgetCubit>().load();
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, ColorConfig.primary],
        ),
      ),
      child: Column(
        children: [
          HeaderSection(),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                        "MASUK",
                        data.absensiIn ?? '-',
                        Colors.lightBlueAccent.shade400.withOpacity(0.25),
                        "assets/icons/icon_svg/sale_service_icon.svg",
                        screenWidth,
                        context,
                      ),
                      buildReports(
                        "PULANG",
                        data.absensiOut ?? '-',
                        Colors.purple.shade200.withOpacity(0.25),
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
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorSchema.primaryColor, reportColor],
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text.rich(
              TextSpan(
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.white,
                  ),
                ),
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
