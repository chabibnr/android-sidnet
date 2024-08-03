part of 'gaji_load_cubit.dart';

class GajiLoadState extends Equatable {
  GajiLoadState({this.data, this.isLoading = true, this.date});

  final GajiList? data;
  final bool isLoading;
  final DateTime? date;

  GajiLoadState copyWith({GajiList? data, bool? isLoading, DateTime? date}) {
    return GajiLoadState(data: data ?? this.data, isLoading: isLoading ?? this.isLoading, date: date ?? this.date);
  }

  @override
  List<Object?> get props => [data, isLoading, date];
}
