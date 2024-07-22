part of 'cuti_load_cubit.dart';

class CutiLoadState extends Equatable {
    CutiLoadState({this.data, this.isLoading = true});

    final CutiList? data;
    final bool isLoading;
    final formKey = GlobalKey<FormBuilderState>();

    CutiLoadState copyWith({CutiList? data, bool? isLoading}) {
        return CutiLoadState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
