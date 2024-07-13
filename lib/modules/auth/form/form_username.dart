import 'dart:developer';

import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/auth/auth_cubit.dart';

class FormUsername extends StatelessWidget {
  const FormUsername({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        bool isValid = (state.username.isValid || state.username.isPure);
        log(isValid.toString());
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            TextField(
              key: const Key('loginForm_usernameInput_textField'),
              onChanged: (value) =>
                  context.read<AuthCubit>().setUsername(value),
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                suffixIcon: const Icon(
                  Icons.account_circle,
                  color: Color(0xFFE2E4E7),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Username",
                hintStyle: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: Color(0xFFE2E4E7), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorSchema.primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ],
        );
      },
    );
  }
}
