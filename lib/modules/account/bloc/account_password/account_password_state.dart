part of 'account_password_cubit.dart';

class AccountPasswordState extends Equatable {
  AccountPasswordState({
    this.data,
    this.isLoading = true,
    this.status = SubmitStatus.idle,
  });

  final Account? data;
  final bool isLoading;
  final SubmitStatus status;
  final formKey = GlobalKey<FormBuilderState>();

  AccountPasswordState copyWith({Account? data, bool? isLoading, SubmitStatus? status}) {
    return AccountPasswordState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [data, isLoading];
}
