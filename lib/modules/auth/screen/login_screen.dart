import 'package:app/bloc/root/root_cubit.dart';
import 'package:app/modules/auth/bloc/auth/auth_cubit.dart';
import 'package:app/modules/auth/form/form_password.dart';
import 'package:app/modules/auth/form/form_username.dart';
import 'package:app/modules/auth/form/login_button.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorSchema.primaryColor, Colors.white],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (context) => AuthCubit(),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.status.isFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Ops',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Password yang anda masukan salah.',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state.status.isSuccess) {
                //tutup halaman dengan membawa parameter true, supaya di redirect ke halaman main
                Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
                BlocProvider.of<RootCubit>(context).openMainScreen();
              }
            },
            child: Container(
              color: Colors.white70,
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/logo/login-logo.png",
                          width: MediaQuery.of(context).size.width * 0.25,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Form(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: FormUsername(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: FormPassword(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginButton(),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
