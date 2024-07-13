import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/auth/auth_cubit.dart';

class FormPassword extends StatelessWidget {
  const FormPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.passwordHidden != current.passwordHidden,
      builder: (context, state) {
        bool isValid = !state.passwordError &&
            (state.password.isValid || state.password.isPure);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            TextField(
              obscureText: state.passwordHidden,
              key: const Key('loginForm_passwordInput_textField'),
              onChanged: (value) =>
                  context.read<AuthCubit>().setPassword(value),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                fillColor: Colors.white,
                filled: true,
                hintText: "Password",
                hintStyle: GoogleFonts.nunito(
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
                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<AuthCubit>().togglePasswordVisibility();
                  },
                  icon: Icon(
                    state.passwordHidden
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
