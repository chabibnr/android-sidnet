import 'dart:developer';

import 'package:app/component/empty_screen.dart';
import 'package:app/modules/spl/bloc/spl_load/spl_load_cubit.dart';
import 'package:app/modules/spl/model/spl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';

import './spl_add_screen.dart';
import './spl_view_screen.dart';

part 'item.dart';

class SplLoadScreen extends StatelessWidget {
  const SplLoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplLoadCubit>().load();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengajuan Lembur"),
        actions: [
          IconButton(
            onPressed: () async {
              final value = await showMonthPicker(
                context: context,
                initialDate: context.read<SplLoadCubit>().state.date ?? DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime.now(),
              );
              if (value != null) {
                context.read<SplLoadCubit>().load(date: value);
              }
            },
            icon: Icon(Icons.date_range_rounded),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SplAddScreen(model: Spl())),
              );
            },
            tooltip: "Pengajuan lembur baru",
            icon: const Icon(
              Icons.add_circle_outline,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: RefreshIndicator(
        onRefresh: () => context.read<SplLoadCubit>().load(),
        child: BlocConsumer<SplLoadCubit, SplLoadState>(
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
                      onTap: () {
                        //viewDetail(context, row);
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

  void viewDetail(BuildContext context, Spl model) {
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
          child: SplViewScreen(model: model),
        );
      },
    );
  }
}
