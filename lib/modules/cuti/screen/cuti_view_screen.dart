import 'dart:developer';

import 'package:app/component/info_row.dart';
import 'package:app/modules/cuti/bloc/cuti_view/cuti_view_cubit.dart';
import 'package:app/modules/cuti/model/cuti.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CutiViewScreen extends StatelessWidget {
  final Cuti model;

  const CutiViewScreen({super.key, required this.model});

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
        appBar: AppBar(
          title: const Text("Detail Cuti"),
        ),
        body: BlocProvider(
          create: (context) => CutiViewCubit()..load(model),
          child: BlocConsumer<CutiViewCubit, CutiViewState>(
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
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        InfoRow(label: "No Pengajuan", value: "${model.cutiNomor}"),
                        InfoRow(label: "Tanggal", value: "${model.cutiTanggal}"),
                        InfoRow(label: "Periode", value: "${model.periode}"),
                        InfoRow(label: "Keperluan", value: "${model.cutiKeperluan}"),
                        InfoRow(label: "Status", value: "${model.cutiStatus}"),
                        InfoRow(label: "Alasan Penolakan", value: "${model.cutiAlasanPenolakan}"),
                      ],
                    ),
                  ),
                );
              }
              return const Center(
                child: Text('Error'),
              );
            },
          ),
        ),
      ),
    );
  }
}
