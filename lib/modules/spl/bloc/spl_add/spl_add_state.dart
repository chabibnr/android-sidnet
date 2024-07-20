part of 'spl_add_cubit.dart';

class SplAddState extends FormStateData<SplAddState, Spl> {
  SplAddState({
    this.data,
    this.isLoading = true,
    this.status = SubmitStatus.idle,
    this.message = '',
  });

  final SubmitStatus status;
  final String message;
  final Spl? data;
  final bool isLoading;
  final formKey = GlobalKey<FormBuilderState>();

  SplAddState copyWith({Spl? data, bool? isLoading, SubmitStatus? status, String? message}) {
    return SplAddState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        data,
        isLoading,
        message,
        status,
      ];
}
