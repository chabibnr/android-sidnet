part of 'absensi_load_cubit.dart';

class AbsensiLoadState extends Equatable {
    const AbsensiLoadState({this.data, this.isLoading = true});

    final AbsensiList? data;
    final bool isLoading;

    AbsensiLoadState copyWith({AbsensiList? data, bool? isLoading}) {
        return AbsensiLoadState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
