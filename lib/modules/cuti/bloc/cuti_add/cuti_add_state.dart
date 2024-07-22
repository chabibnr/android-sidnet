part of 'cuti_add_cubit.dart';

class CutiAddState extends Equatable {
    CutiAddState({this.data, this.isLoading = true});

    final Cuti? data;
    final bool isLoading;
    final formKey = GlobalKey<FormBuilderState>();

    CutiAddState copyWith({Cuti? data, bool? isLoading}) {
        return CutiAddState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
