import 'dart:developer';

import 'package:app/component/custom_input_decoration.dart';
import 'package:app/config/color_config.dart';
import 'package:app/helper/form_state.dart';
import 'package:app/modules/account/bloc/account_cubit.dart';
import 'package:app/modules/account/bloc/account_password/account_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

part 'info_row.dart';

enum PopupMenu {
  changePicture,
  changePassword,
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  formChangePassword(BuildContext context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return BlocProvider(
            create: (context) => AccountPasswordCubit(),
            child: BlocConsumer<AccountPasswordCubit, AccountPasswordState>(
              listener: (context, state) {
                if (state.status == SubmitStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Sukses',
                            style: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Kata sandi telah diganti.',
                            style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                return AlertDialog(
                  title: const Text('Ganti Kata Sandi'),
                  icon: CircleAvatar(
                    backgroundColor: ColorConfig.primary,
                    child: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: FormBuilder(
                      key: state.formKey,
                      child: ListBody(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            child: Text(
                              "Silahkan masukan kata sandi baru dan konfirmasi kata sandi.",
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(8))),
                            padding: const EdgeInsets.only(top: 20),
                            child: FormBuilderTextField(
                              obscureText: true,
                              name: 'password',
                              decoration: CustomInputDecoration().floating('Kata Sandi').copyWith(
                                    hintText: "Kata sandi baru",
                                  ),
                              validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            decoration: const BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(8))),
                            padding: const EdgeInsets.only(top: 20),
                            child: FormBuilderTextField(
                              obscureText: true,
                              name: 'confirm',
                              decoration: CustomInputDecoration().floating('Konfirmasi Kata Sandi').copyWith(
                                    hintText: "Konfirmasi Kata sandi baru",
                                  ),
                              validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                            ),
                          ),
                          if (state.data?.respError == true)
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color: Colors.red.shade100,
                                  border: Border.fromBorderSide(BorderSide(
                                    color: Colors.red.shade100,
                                  ))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${state.data?.respMsg}",
                                    style: GoogleFonts.nunito(
                                      color: Colors.red.shade400,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        'Batal',
                        style: GoogleFonts.nunito(
                          color: Colors.redAccent,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      onPressed: context.read<AccountPasswordCubit>().state.status == SubmitStatus.progress
                          ? null
                          : () {
                              context.read<AccountPasswordCubit>().execute();
                            },
                      child: context.read<AccountPasswordCubit>().state.status == SubmitStatus.progress ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator()) : const Text('Ganti Sandi'),
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    context.read<AccountCubit>().load();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF4D7CEB), Colors.white],
        ),
      ),
      child: Scaffold(
        body: BlocConsumer<AccountCubit, AccountState>(
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
              return Stack(
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
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
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
                                    showDivider: false,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            height: 100,
                          )
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
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 10,
                    child: PopupMenuButton<PopupMenu>(
                      iconColor: Colors.white,
                      onSelected: (PopupMenu value) {
                        if (value == PopupMenu.changePassword) {
                          formChangePassword(context);
                        } else if (value == PopupMenu.changePicture) {}
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem<PopupMenu>(
                            value: PopupMenu.changePicture,
                            child: Text('Ganti Foto Profil'),
                          ),
                          const PopupMenuItem<PopupMenu>(
                            value: PopupMenu.changePassword,
                            child: Text('Ganti Kata Sandi'),
                          ),
                        ];
                      },
                    ),
                  )
                ],
              );
            }
            return const Center(
              child: Text('Error'),
            );
          },
        ),
      ),
    );
  }
}
