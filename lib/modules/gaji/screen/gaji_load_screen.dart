import 'dart:developer';

import 'package:app/component/empty_screen.dart';
import 'package:app/modules/gaji/bloc/gaji_load/gaji_load_cubit.dart';
import 'package:app/modules/gaji/model/gaji.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import './gaji_view_screen.dart';

part 'item.dart';

class GajiLoadScreen extends StatelessWidget {
  const GajiLoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GajiLoadCubit>().load();
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
          title: const Text("Daftar Gaji"),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: BlocConsumer<GajiLoadCubit, GajiLoadState>(
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
              if (data.items == null || data.items!.isEmpty) {
                return Container(
                  width: double.infinity,
                  child: const EmptyScreen(
                    title: "Tidak Ada Data",
                    subtitle: "Belum ada data untuk tahun 2024",
                  ),
                );
              }
              return ListView.builder(
                  itemCount: data.items?.length,
                  itemBuilder: (BuildContext context, int index) {
                    var row = data.items![index];
                    return GestureDetector(
                      onTap: () {
                        viewDetail(context, row);
                      },
                      child: Item(model: row),
                    );
                  });
            }
            return const Center(
              child: Text('Error'),
            );
          },
        ),
      ),
    );
  }

  void viewDetail(BuildContext context, Gaji model) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: GajiViewScreen(model: model),
        );
      },
    );
  }
}
