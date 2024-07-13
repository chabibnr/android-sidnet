part of 'absensi_add_cubit.dart';

class AbsensiAddState extends Equatable {
  AbsensiAddState({this.data, this.isLoading = true});

  final Absensi? data;
  final bool isLoading;
  final formKey = GlobalKey<FormBuilderState>();

  AbsensiAddState copyWith({Absensi? data, bool? isLoading}) {
    return AbsensiAddState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [data, isLoading];
}
