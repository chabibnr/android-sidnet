part of 'cuti_view_cubit.dart';

class CutiViewState extends Equatable {
    CutiViewState({this.data, this.isLoading = true});

    final Cuti? data;
    final bool isLoading;
    final formKey = GlobalKey<FormBuilderState>();

    CutiViewState copyWith({Cuti? data, bool? isLoading}) {
        return CutiViewState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
