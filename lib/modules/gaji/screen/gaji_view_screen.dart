import 'dart:developer';

import 'package:app/component/info_row.dart';
import 'package:app/modules/gaji/bloc/gaji_view/gaji_view_cubit.dart';
import 'package:app/modules/gaji/model/gaji.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GajiViewScreen extends StatelessWidget {
  final Gaji model;

  const GajiViewScreen({super.key, required this.model});

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
          title: const Text("Detail Gaji"),
        ),
        body: BlocProvider(
          create: (context) => GajiViewCubit()..load(model),
          child: BlocConsumer<GajiViewCubit, GajiViewState>(
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
                    child: ListView(
                      children: [
                        InfoRow(
                          label: "Nama",
                          value: data.pegawaiNama,
                        ),
                        InfoRow(
                          label: "Jabatan",
                          value: data.jabatanNama,
                        ),
                        InfoRow(
                          label: "Periode",
                          value: data.jabatanNama,
                        ),
                        InfoRow(
                          label: "Gaji Pokok",
                          value: data.gaji?.gajiPokok,
                        ),
                        InfoRow(
                          label: "Tunjangan Hadir",
                          value: data.gaji?.gajiTunjHadir,
                        ),
                        InfoRow(
                          label: "Tunjangan Insentif",
                          value: data.gaji?.gajiTunjInsentif,
                        ),
                        InfoRow(
                          label: "Tunjangan Makan",
                          value: data.gaji?.gajiTunjMakan,
                        ),
                        InfoRow(
                          label: "Tunjangan Lainnya",
                          value: data.gaji?.gajiTunjLain,
                        ),
                        InfoRow(
                          label: "Jam Lembur",
                          value: data.gaji?.gajiJamLembur,
                        ),
                        InfoRow(
                          label: "Gaji Lembur",
                          value: data.gaji?.gajiLembur,
                        ),
                        InfoRow(
                          label: "Gaji Kotor",
                          value: data.gaji?.gajiBruto,
                        ),
                        InfoRow(
                          label: "Potongan Kesehatan",
                          value: data.gaji?.gajiPotKesehatan,
                        ),
                        InfoRow(
                          label: "Potongan Tenaga Kerja",
                          value: data.gaji?.gajiPotTenagakerja,
                        ),
                        InfoRow(
                          label: "Potongan Telat",
                          value: data.gaji?.gajiPotTelat,
                        ),
                        InfoRow(
                          label: "Menit Telat",
                          value: data.gaji?.gajiMenittelat,
                        ),
                        InfoRow(
                          label: "Potongan Absensi",
                          value: data.gaji?.gajiPotAbsensi,
                        ),
                        InfoRow(
                          label: "Potongan Sanksi",
                          value: data.gaji?.gajiPotSangsi,
                        ),
                        InfoRow(
                          label: "Potongan Denda",
                          value: data.gaji?.gajiPotDenda,
                        ),
                        InfoRow(
                          label: "Potongan Angsuran",
                          value: data.gaji?.gajiPotAngsuran,
                        ),
                        InfoRow(
                          label: "Potongan Lainnya",
                          value: data.gaji?.gajiPotLain,
                        ),
                        InfoRow(
                          label: "Gaji Bersih",
                          value: data.gaji?.gajiNetto,
                        ),
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
