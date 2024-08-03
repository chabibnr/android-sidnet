import 'dart:developer';

import 'package:app/modules/account/bloc/account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

part 'info_row.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit()..load(),
      child: BlocConsumer<AccountCubit, AccountState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          log("Reload ${state.isLoading}");
          if (state.isLoading && state.data == null) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final data = state.data;
          if (data != null) {
            return Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF4D7CEB), Colors.white],
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 50),
                            Center(
                              child: CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(data.avatar!),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    data.nama ?? "",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  Text(
                                    data.jabatan ?? "",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                            Card(
                              margin: EdgeInsets.zero,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 16,
                                  left: 16,
                                  right: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Account Info",
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    ProfileInfoRow(
                                      iconPath: "assets/icons/icon_svg/profile_name.svg",
                                      label: "Username",
                                      value: data.username,
                                    ),
                                    ProfileInfoRow(
                                      iconPath: "assets/icons/icon_svg/profile_phone.svg",
                                      label: "Telepon",
                                      value: data.telp,
                                    ),
                                    ProfileInfoRow(
                                      iconPath: "assets/icons/icon_svg/profile_email.svg",
                                      label: "Email",
                                      value: data.email,
                                    ),
                                    ProfileInfoRow(
                                      iconPath: "assets/icons/icon_svg/profile_role.svg",
                                      label: "Jabatan",
                                      value: data.jabatan,
                                    ),
                                    ProfileInfoRow(
                                      iconPath: "assets/icons/icon_svg/profile_company.svg",
                                      label: "Cabang",
                                      value: data.cabangNama,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 30,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.keyboard_arrow_left),
                          color: Colors.white,
                          iconSize: 30,
                        ))
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        },
      ),
    );
  }
}
