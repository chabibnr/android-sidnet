import 'dart:developer';

import 'package:app/modules/spl/bloc/spl_update/spl_update_cubit.dart';
import 'package:app/modules/spl/model/spl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/utils/contstants.dart';
import 'package:app/component/custom_input_decoration.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'form_part.dart';

class SplUpdateScreen extends StatelessWidget {
    final Spl model;
    const SplUpdateScreen({super.key, required this.model});

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
                    title: const Text("SplUpdate Screen Title"),
                ),
                backgroundColor: Colors.transparent,
                body: BlocProvider(
                    create: (context) => SplUpdateCubit()..load(model),
                    child: BlocConsumer<SplUpdateCubit, SplUpdateState>(
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
