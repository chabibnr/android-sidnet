part of 'spl_add_cubit.dart';

class SplAddState extends Equatable {
    SplAddState({this.data, this.isLoading = true});

    final Spl? data;
    final bool isLoading;
    final formKey = GlobalKey<FormBuilderState>();

    SplAddState copyWith({Spl? data, bool? isLoading}) {
        return SplAddState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
