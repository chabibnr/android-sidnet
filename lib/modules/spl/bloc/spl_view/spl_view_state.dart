part of 'spl_view_cubit.dart';

class SplViewState extends Equatable {
    SplViewState({this.data, this.isLoading = true});

    final Spl? data;
    final bool isLoading;
    final formKey = GlobalKey<FormBuilderState>();

    SplViewState copyWith({Spl? data, bool? isLoading}) {
        return SplViewState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
