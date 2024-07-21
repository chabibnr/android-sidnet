part of 'pinjaman_load_cubit.dart';

class PinjamanLoadState extends Equatable {
    PinjamanLoadState({this.data, this.isLoading = true});

    final PinjamanList? data;
    final bool isLoading;
    final formKey = GlobalKey<FormBuilderState>();

    PinjamanLoadState copyWith({PinjamanList? data, bool? isLoading}) {
        return PinjamanLoadState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
