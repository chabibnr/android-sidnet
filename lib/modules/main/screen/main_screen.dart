import 'package:app/modules/absensi/model/absensi.dart';
import 'package:app/modules/absensi/screen/absensi_add_screen.dart';
import 'package:app/modules/absensi/screen/absensi_widget_screen.dart';
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
              child: HeaderSection(
                openDrawer: () {
                  _key.currentState?.openDrawer();
                },
              ),
            )
          : null,
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
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
          appBar: true
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(80),
                  child: HeaderSection(
                    openDrawer: () {},
                  ),
                )
              : null,
          floatingActionButton: FloatingActionButton.extended(
            extendedPadding: EdgeInsets.symmetric(horizontal: 24),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AbsensiAddScreen(model: Absensi())),
              );
            },
            label: Text(
              "Absensi Masuk",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: ColorSchema.primaryColor,
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      },
      listener: (context, state) {},
    );
  }
}
