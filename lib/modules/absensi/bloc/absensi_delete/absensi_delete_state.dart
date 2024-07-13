part of 'absensi_delete_cubit.dart';

class AbsensiDeleteState extends Equatable {
    const AbsensiDeleteState({this.data, this.isLoading = true});

    final Absensi? data;
    final bool isLoading;

    AbsensiDeleteState copyWith({Absensi? data, bool? isLoading}) {
        return AbsensiDeleteState(
            data: data ?? this.data,
            isLoading: isLoading ?? this.isLoading,
        );
    }

    @override
    List<Object?> get props => [data, isLoading];
}
