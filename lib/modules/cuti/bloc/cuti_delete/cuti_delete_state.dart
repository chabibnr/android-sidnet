part of 'cuti_delete_cubit.dart';

class CutiDeleteState extends Equatable {
    CutiDeleteState({this.data, this.isLoading = true});

    final Cuti? data;
    final bool isLoading;
    final formKey = GlobalKey<FormBuilderState>();

    CutiDeleteState copyWith({Cuti? data, bool? isLoading}) {
        return CutiDeleteState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
