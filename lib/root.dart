import 'dart:developer';

import 'package:app/bloc/root/root_cubit.dart';
import 'package:app/helper/dialog.dart';
import 'package:app/modules/auth/screen/login_screen.dart';
import 'package:app/modules/main/bloc/main_cubit.dart';
import 'package:app/modules/main/screen/main_screen.dart';
import 'package:app/modules/main/screen/splash_screen.dart';
import 'package:app/modules/spl/bloc/spl_load/spl_load_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("Root Widget initialize");
    return BlocConsumer<RootCubit, RootState>(
      listenWhen: (prev, current) {
        log('$prev $current');
        if (prev is RootAuthDestroy && current is RootAuthDestroy && prev.count == current.count) {
          return false;
        }
        return true;
      },
      listener: (context, state) {
        if (state is RootInitialize) {
          Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
          BlocProvider.of<RootCubit>(context).load();
          return;
        }
        if (state is RootAuthDestroy) {
          log('listener RootAuthDestroy called');
          warningDialog(
              context: context,
              okText: 'Keluar',
              onPress: () {
                BlocProvider.of<RootCubit>(context).authDestroy();
              },
              caption: 'Yakin ingin keluar dari applikasi?',
              onCancel: () {
                //nothing
              });
        }
      },
      buildWhen: (prev, current) {
        if (current is RootAuthDestroy || current is RootInitialize) {
          log('builder RootAuthDestroy called');
          return false;
        }
        return true;
      },
      builder: (_, state) {
        if (state is RootMain) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<MainCubit>(
                create: (context) => MainCubit(),
              ),

              /*BlocProvider<HomeCubit>(
                create: (context) => HomeCubit()..load(),
              ),
              BlocProvider<MainCubit>(
                create: (context) => MainCubit(),
              ),
              BlocProvider<LearningCubit>(
                create: (context) => LearningCubit(),
              ),
              BlocProvider<QuizCubit>(
                create: (context) => QuizCubit(),
              ),
              BlocProvider<MapelCubit>(
                create: (context) => MapelCubit(),
              ),*/
            ],
            child: MainScreen(),
          );
        }

        if (state is RootAuth) {
          return const LoginScreen();
        }

        return SplashScreen();
      },
    );
  }
}
