part of 'absensi_view_cubit.dart';

class AbsensiViewState extends Equatable {
    const AbsensiViewState({this.data, this.isLoading = true});

    final Absensi? data;
    final bool isLoading;

    AbsensiViewState copyWith({Absensi? data, bool? isLoading}) {
        return AbsensiViewState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
