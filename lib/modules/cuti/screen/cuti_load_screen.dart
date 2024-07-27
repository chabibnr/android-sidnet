import 'dart:developer';

import 'package:app/component/empty_screen.dart';
import 'package:app/modules/cuti/bloc/cuti_load/cuti_load_cubit.dart';
import 'package:app/modules/cuti/model/cuti.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import './cuti_add_screen.dart';
import './cuti_view_screen.dart';

part 'item.dart';

class CutiLoadScreen extends StatelessWidget {
  const CutiLoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CutiLoadCubit>().load();
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
          title: const Text("Permintaan Cuti"),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: BlocConsumer<CutiLoadCubit, CutiLoadState>(
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
                    title: "Tidak ada data SPL",
                    subtitle: "",
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<CutiLoadCubit>().load();
                },
                child: ListView.builder(
                    itemCount: data.items?.length,
                    itemBuilder: (BuildContext context, int index) {
                      var row = data.items![index];
                      return GestureDetector(
                        onTap: () {
                          viewDetail(context, row);
                        },
                        child: Item(model: row),
                      );
                    }),
              );
            }
            return const Center(
              child: Text('Error'),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CutiAddScreen(model: Cuti())),
            );
          },
          backgroundColor: ColorSchema.primaryColor,
          label: Text(
            'Pengajuan Cuti',
            style: GoogleFonts.nunito(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void viewDetail(BuildContext context, Cuti model) {
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
          child: CutiViewScreen(model: model),
        );
      },
    );
  }
}
