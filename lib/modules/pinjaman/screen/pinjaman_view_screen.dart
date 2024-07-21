import 'dart:developer';

import 'package:app/component/empty_screen.dart';
import 'package:app/modules/pinjaman/bloc/pinjaman_view/pinjaman_view_cubit.dart';
import 'package:app/modules/pinjaman/model/angsuran.dart';
import 'package:app/modules/pinjaman/model/pinjaman.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

part 'item_angsuran.dart';

class PinjamanViewScreen extends StatelessWidget {
  final Pinjaman model;

  const PinjamanViewScreen({super.key, required this.model});

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
          title: const Text("Detail Angsuran"),
        ),
        body: BlocProvider(
          create: (context) => PinjamanViewCubit()..load(model),
          child: BlocConsumer<PinjamanViewCubit, PinjamanViewState>(
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
                return ListView.builder(
                    itemCount: data.items?.length,
                    itemBuilder: (BuildContext context, int index) {
                      var row = data.items![index];
                      return GestureDetector(
                        onTap: () {},
                        child: ItemAngsuran(model: row),
                      );
                    });
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
