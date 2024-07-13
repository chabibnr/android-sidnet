import 'dart:developer';

import 'package:app/modules/absensi/bloc/absensi_load/absensi_load_cubit.dart';
import 'package:app/modules/absensi/model/absensi.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './absensi_add_screen.dart';
import './absensi_view_screen.dart';

part 'item.dart';

class AbsensiLoadScreen extends StatelessWidget {
  const AbsensiLoadScreen({super.key});

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
          title: const Text("Data Absensi"),
        ),
        body: BlocProvider(
          create: (context) => AbsensiLoadCubit()..load(),
          child: BlocConsumer<AbsensiLoadCubit, AbsensiLoadState>(
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
                  },
                );
              }
              return const Center(
                child: Text('Error'),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AbsensiAddScreen(model: Absensi())),
            );
          },
          label: const Text('Add'),
        ),
      ),
    );
  }

  void viewDetail(BuildContext context, Absensi model) {
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
          child: AbsensiViewScreen(model: model),
        );
      },
    );
  }
}
