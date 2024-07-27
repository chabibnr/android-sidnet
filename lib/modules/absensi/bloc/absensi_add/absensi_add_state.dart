part of 'absensi_add_cubit.dart';

class AbsensiAddState extends Equatable {
  AbsensiAddState({
    this.data,
    this.isLoading = true,
    this.status = SubmitStatus.idle,
    this.message = '',
    this.position,
    this.photo,
  });

  final Absensi? data;
  final bool isLoading;
  final SubmitStatus status;
  final String message;
  final Position? position;
  final XFile? photo;

  final formKey = GlobalKey<FormBuilderState>();

  AbsensiAddState copyWith({
    Absensi? data,
    bool? isLoading,
    SubmitStatus? status,
    String? message,
    Position? position,
    XFile? photo,
  }) {
    return AbsensiAddState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      message: message ?? this.message,
      position: position ?? this.position,
      photo: photo ?? this.photo,
    );
  }

  @override
  List<Object?> get props => [
        data,
        isLoading,
        status,
        message,
        position,
        photo,
      ];
}
