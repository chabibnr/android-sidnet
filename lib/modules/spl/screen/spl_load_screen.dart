import 'dart:developer';

import 'package:app/component/empty_screen.dart';
import 'package:app/modules/spl/bloc/spl_load/spl_load_cubit.dart';
import 'package:app/modules/spl/model/spl.dart';
import 'package:app/utils/contstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './spl_add_screen.dart';
import './spl_view_screen.dart';

part 'item.dart';

class SplLoadScreen extends StatelessWidget {
  const SplLoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplLoadCubit>().load();
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
          title: const Text("Pengajuan Lembur"),
          backgroundColor: Colors.transparent,
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
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SplAddScreen(model: Spl())),
            );
          },
          label: const Text('Add'),
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
