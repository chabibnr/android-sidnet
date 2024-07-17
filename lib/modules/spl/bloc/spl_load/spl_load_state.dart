part of 'spl_load_cubit.dart';

class SplLoadState extends Equatable {
    SplLoadState({this.data, this.isLoading = true});

    final SplList? data;
    final bool isLoading;
    final formKey = GlobalKey<FormBuilderState>();

    SplLoadState copyWith({SplList? data, bool? isLoading}) {
        return SplLoadState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
