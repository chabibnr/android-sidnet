part of 'pinjaman_load_cubit.dart';

class PinjamanLoadState extends Equatable {
  PinjamanLoadState({this.data, this.isLoading = true, this.date});

  final PinjamanList? data;
  final bool isLoading;
  final DateTime? date;

  PinjamanLoadState copyWith({PinjamanList? data, bool? isLoading, DateTime? date}) {
    return PinjamanLoadState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [data, isLoading, date];
}
