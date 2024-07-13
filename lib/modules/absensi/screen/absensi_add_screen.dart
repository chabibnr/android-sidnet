import 'dart:developer';

import 'package:app/modules/absensi/bloc/absensi_add/absensi_add_cubit.dart';
import 'package:app/modules/absensi/model/absensi.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_part.dart';

class AbsensiAddScreen extends StatelessWidget {
  final Absensi model;

  const AbsensiAddScreen({super.key, required this.model});

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
          title: const Text("AbsensiAdd Screen Title"),
        ),
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (context) => AbsensiAddCubit()..load(model),
          child: BlocConsumer<AbsensiAddCubit, AbsensiAddState>(
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
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: FormPart(
                      isLoading: state.isLoading,
                      model: data,
                      formKey: state.formKey,
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
