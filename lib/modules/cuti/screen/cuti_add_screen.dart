import 'dart:developer';

import 'package:app/modules/cuti/bloc/cuti_add/cuti_add_cubit.dart';
import 'package:app/modules/cuti/model/cuti.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_part.dart';

class CutiAddScreen extends StatelessWidget {
  final Cuti model;

  const CutiAddScreen({super.key, required this.model});

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
          title: const Text("CutiAdd Screen Title"),
        ),
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (context) => CutiAddCubit()..load(model),
          child: BlocConsumer<CutiAddCubit, CutiAddState>(
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
                      isUpdate: false,
                      isLoading: state.isLoading,
                      model: data,
                      formKey: state.formKey,
                      jenisCuti: state.jenisCuti,
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
