part of 'spl_delete_cubit.dart';

class SplDeleteState extends Equatable {
    SplDeleteState({this.data, this.isLoading = true});

    final Spl? data;
    final bool isLoading;
    final formKey = GlobalKey<FormBuilderState>();

    SplDeleteState copyWith({Spl? data, bool? isLoading}) {
        return SplDeleteState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
