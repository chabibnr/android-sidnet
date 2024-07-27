import 'package:app/modules/absensi/bloc/absensi_widget/absensi_widget_cubit.dart';
import 'package:app/modules/absensi/model/absensi.dart';
import 'package:app/modules/absensi/screen/absensi_add_screen.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonAbsensi extends StatelessWidget {
  final Absensi model;

  const ButtonAbsensi({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsensiWidgetCubit, AbsensiWidgetState>(builder: (context, state) {
      if (state.data == null) {
        return Container();
      }
      var data = state.data!;
      if (data.hasIn && data.hasOut) {
        return Container();
      }
      return FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.symmetric(horizontal: 24),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AbsensiAddScreen(model: model)),
          );
        },
        label: Text(
          !data.hasIn ? "Absensi Masuk" : "Absensi Pulang",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorSchema.primaryColor,
        icon: const Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
        ),
      );
    });
  }
}
