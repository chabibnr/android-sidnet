import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/auth/auth_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      //buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorSchema.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          onPressed: () => context.read<AuthCubit>().submit(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 40),
            child: state.status.isInProgress
                ? const SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 3,
                    ),
                  )
                : Text(
                    'Login',
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
          ),
        );
      },
    );
  }
}
