import 'dart:developer';

import 'package:app/modules/absensi/bloc/absensi_view/absensi_view_cubit.dart';
import 'package:app/modules/absensi/model/absensi.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AbsensiViewScreen extends StatelessWidget {
  final Absensi model;

  const AbsensiViewScreen({super.key, required this.model});

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
          title: const Text("AbsensiView Screen Title"),
        ),
        body: BlocProvider(
          create: (context) => AbsensiViewCubit()..load(model),
          child: BlocConsumer<AbsensiViewCubit, AbsensiViewState>(
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
                return ListView(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text('Title'),
                        subtitle: Text('sub title'),
                      ),
                    ),
                  ],
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
