part of 'cuti_update_cubit.dart';

class CutiUpdateState extends Equatable {
  CutiUpdateState({
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

  CutiUpdateState copyWith({Cuti? data, bool? isLoading, SubmitStatus? status, String? message, List<dynamic>? jenisCuti}) {
    return CutiUpdateState(
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
