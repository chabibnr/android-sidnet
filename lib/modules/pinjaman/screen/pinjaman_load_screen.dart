import 'dart:developer';

import 'package:app/component/empty_screen.dart';
import 'package:app/modules/pinjaman/bloc/pinjaman_load/pinjaman_load_cubit.dart';
import 'package:app/modules/pinjaman/model/pinjaman.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import './pinjaman_view_screen.dart';

part 'item.dart';

class PinjamanLoadScreen extends StatelessWidget {
  const PinjamanLoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PinjamanLoadCubit>().load();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Pinjaman"),
        actions: [
          IconButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  print(context.read<PinjamanLoadCubit>().state.date ?? DateTime.now());
                  return AlertDialog(
                    title: Text("Pilih Tahun"),
                    content: Container(
                      // Need to use container to add size constraint.
                      width: 300,
                      height: 300,
                      child: YearPicker(
                        firstDate: DateTime(2022),
                        lastDate: DateTime.now(),
                        // save the selected date to _selectedDate DateTime variable.
                        // It's used to set the previous selected date when
                        // re-showing the dialog.
                        selectedDate: context.read<PinjamanLoadCubit>().state.date,
                        onChanged: (DateTime dateTime) {
                          // close the dialog when year is selected.
                          context.read<PinjamanLoadCubit>().load(date: dateTime);
                          Navigator.pop(context);
                          // Do something with the dateTime selected.
                          // Remember that you need to use dateTime.year to get the year
                        },
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.date_range_rounded),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: BlocConsumer<PinjamanLoadCubit, PinjamanLoadState>(
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
                child: EmptyScreen(
                  title: "Tidak ada pinjaman tahun ${state.date?.year}",
                  subtitle: "",
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
    );
  }

  void viewDetail(BuildContext context, Pinjaman model) {
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
          child: PinjamanViewScreen(model: model),
        );
      },
    );
  }
}
