part of 'cuti_add_cubit.dart';

class CutiAddState extends Equatable {
  CutiAddState({
    this.data,
    this.isLoading = true,
    this.status = SubmitStatus.idle,
    this.message = '',
    this.jenisCuti = const [],
  });

  final SubmitStatus status;
  final String message;
  final Cuti? data;
  final bool isLoading;
  final List<dynamic> jenisCuti;
  final formKey = GlobalKey<FormBuilderState>();

  CutiAddState copyWith({Cuti? data, bool? isLoading, SubmitStatus? status, String? message, List<dynamic>? jenisCuti}) {
    return CutiAddState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      message: message ?? this.message,
      jenisCuti: jenisCuti ?? this.jenisCuti,
    );
  }

  @override
  List<Object?> get props => [
        data,
        isLoading,
        message,
        status,
        jenisCuti,
      ];
}
