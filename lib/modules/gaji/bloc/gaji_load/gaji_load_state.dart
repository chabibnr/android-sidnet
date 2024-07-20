part of 'gaji_load_cubit.dart';

class GajiLoadState extends Equatable {
    GajiLoadState({this.data, this.isLoading = true});

    final GajiList? data;
    final bool isLoading;
    final formKey = GlobalKey<FormBuilderState>();

    GajiLoadState copyWith({GajiList? data, bool? isLoading}) {
        return GajiLoadState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
