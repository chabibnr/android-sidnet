part of 'spl_update_cubit.dart';

class SplUpdateState extends Equatable {
    SplUpdateState({this.data, this.isLoading = true});

    final Spl? data;
    final bool isLoading;
    final formKey = GlobalKey<FormBuilderState>();

    SplUpdateState copyWith({Spl? data, bool? isLoading}) {
        return SplUpdateState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
