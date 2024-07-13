part of 'absensi_update_cubit.dart';

class AbsensiUpdateState extends Equatable {
    const AbsensiUpdateState({this.data, this.isLoading = true});

    final Absensi? data;
    final bool isLoading;

    AbsensiUpdateState copyWith({Absensi? data, bool? isLoading}) {
        return AbsensiUpdateState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
