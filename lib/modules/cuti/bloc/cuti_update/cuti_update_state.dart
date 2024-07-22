part of 'cuti_update_cubit.dart';

class CutiUpdateState extends Equatable {
    CutiUpdateState({this.data, this.isLoading = true});

    final Cuti? data;
    final bool isLoading;
    final formKey = GlobalKey<FormBuilderState>();

    CutiUpdateState copyWith({Cuti? data, bool? isLoading}) {
        return CutiUpdateState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
