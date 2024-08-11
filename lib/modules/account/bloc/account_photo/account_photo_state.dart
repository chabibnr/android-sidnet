part of 'account_photo_cubit.dart';

class AccountPhotoState extends Equatable {
  AccountPhotoState({
    this.data,
    this.isLoading = true,
    this.status = SubmitStatus.idle,
  });

  final Account? data;
  final bool isLoading;
  final SubmitStatus status;
  final formKey = GlobalKey<FormBuilderState>();

  AccountPhotoState copyWith({Account? data, bool? isLoading, SubmitStatus? status}) {
    return AccountPhotoState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [data, isLoading, status];
}
