import 'dart:developer';

import 'package:app/helper/form_state.dart';
import 'package:app/modules/spl/bloc/spl_add/spl_add_cubit.dart';
import 'package:app/modules/spl/bloc/spl_load/spl_load_cubit.dart';
import 'package:app/modules/spl/model/spl.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_part.dart';

class SplAddScreen extends StatelessWidget {
  final Spl model;

  const SplAddScreen({super.key, required this.model});

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
          title: const Text("Form Pengajuan Lembur"),
        ),
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (context) => SplAddCubit()..load(model),
          child: BlocConsumer<SplAddCubit, SplAddState>(
            listener: (context, state) {
              if (state.status == SubmitStatus.success) {
                Navigator.of(context).pop();
                context.read<SplLoadCubit>().load();
              }
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
