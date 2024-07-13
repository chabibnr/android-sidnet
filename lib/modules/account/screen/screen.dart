import 'dart:developer';

import 'package:app/modules/account/bloc/account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Title"),
      ),
      body: BlocProvider(
        create: (context) => AccountCubit()..load(),
        child: BlocConsumer<AccountCubit, AccountState>(
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
                child: Text('Content'),
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
