import 'package:app/modules/absensi/model/absensi.dart';
import 'package:app/modules/absensi/screen/absensi_widget_screen.dart';
import 'package:app/modules/absensi/screen/button_absensi.dart';
import 'package:app/modules/main/bloc/main_cubit.dart';
import 'package:app/modules/main/screen/header_section.dart';
import 'package:app/modules/main/screen/service_section.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreens> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      key: _key,
      body: Container(
        color: Colors.white70,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            AbsensiWidgetScreen(),
            ServicesSection(),
          ],
        ),
      ),
      appBar: isSmallScreen
          ? PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: HeaderSection(),
            )
          : null,
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
      child: BlocConsumer<MainCubit, MainState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              color: Colors.transparent,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Image.asset(
                    "assets/images/logo/logo.png",
                    height: 100,
                  ),
                  AbsensiWidgetScreen(),
                  ServicesSection(),
                ],
              ),
            ),
            floatingActionButton: ButtonAbsensi(model: Absensi()),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
