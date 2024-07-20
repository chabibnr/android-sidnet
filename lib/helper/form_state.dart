import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

enum SubmitStatus {
  idle,
  progress,
  success,
  failure,
}

class FormStateData<State, Model> extends Equatable {
  FormStateData({
    this.data,
    this.isLoading = true,
    this.status = SubmitStatus.idle,
    this.message = '',
  });

  final SubmitStatus status;
  final String message;
  final Model? data;
  final bool isLoading;
  final formKey = GlobalKey<FormBuilderState>();

  dynamic copyWith({Model? data, bool? isLoading, SubmitStatus? status, String? message}) {
    return (
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      message: message ?? this.message,
    ) as State;
  }

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    print(other);
    return super == other;
  }

  @override
  List<Object?> get props => [
        data,
        isLoading,
        message,
        status,
      ];
}
