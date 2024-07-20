part of 'gaji_view_cubit.dart';

class GajiViewState extends Equatable {
  GajiViewState({this.data, this.isLoading = true});

  final DetailGaji? data;
  final bool isLoading;
  final formKey = GlobalKey<FormBuilderState>();

  GajiViewState copyWith({DetailGaji? data, bool? isLoading}) {
    return GajiViewState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [data, isLoading];
}
