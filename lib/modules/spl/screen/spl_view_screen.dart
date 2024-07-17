import 'dart:developer';

import 'package:app/modules/spl/bloc/spl_view/spl_view_cubit.dart';
import 'package:app/modules/spl/model/spl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplViewScreen extends StatelessWidget {
    final Spl model;
    const SplViewScreen({super.key, required this.model});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("SplView Screen Title"),
            ),
            body: BlocProvider(
                create: (context) => SplViewCubit()..load(model),
                child: BlocConsumer<SplViewCubit, SplViewState>(
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
                                    ListTile(
                                        title: Text('Title'),
                                        subtitle: Text('sub title'),
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
        );
    }
}
