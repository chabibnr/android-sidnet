part of 'absensi_widget_cubit.dart';

class AbsensiWidgetState extends Equatable {
  AbsensiWidgetState({this.data, this.isLoading = true});

  final AbsensiWidget? data;
  final bool isLoading;
  final formKey = GlobalKey<FormBuilderState>();

  AbsensiWidgetState copyWith({AbsensiWidget? data, bool? isLoading}) {
    return AbsensiWidgetState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [data, isLoading];
}
