part of 'absensi_load_cubit.dart';

class AbsensiLoadState extends Equatable {
  AbsensiLoadState({
    this.data,
    this.isLoading = true,
    this.date,
  });

  final AbsensiList? data;
  final bool isLoading;
  final DateTime? date;

  AbsensiLoadState copyWith({AbsensiList? data, bool? isLoading, DateTime? date}) {
    return AbsensiLoadState(data: data ?? this.data, isLoading: isLoading ?? this.isLoading, date: date ?? this.date);
  }

  @override
  List<Object?> get props => [data, isLoading, date];
}
