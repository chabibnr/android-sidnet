import 'dart:developer';

import 'package:app/modules/absensi/bloc/absensi_update/absensi_update_cubit.dart';
import 'package:app/modules/absensi/model/absensi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AbsensiUpdateScreen extends StatelessWidget {
    final Absensi model;
    const AbsensiUpdateScreen({super.key, required this.model});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("AbsensiUpdate Screen Title"),
            ),
            body: BlocProvider(
                create: (context) => AbsensiUpdateCubit()..load(model),
                child: BlocConsumer<AbsensiUpdateCubit, AbsensiUpdateState>(
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
                            return const SingleChildScrollView(
                                child: Text('AbsensiUpdate Content'),
                            );
                        }
                        return const Center(
                            child: Text('Error'),
                        );
                    },
                ),
            ),
        );
    }
}
