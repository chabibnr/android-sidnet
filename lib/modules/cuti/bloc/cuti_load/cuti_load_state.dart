part of 'cuti_load_cubit.dart';

class CutiLoadState extends Equatable {
  CutiLoadState({this.data, this.isLoading = true, this.date});

  final CutiList? data;
  final bool isLoading;
  final DateTime? date;

  CutiLoadState copyWith({CutiList? data, bool? isLoading, DateTime? date}) {
    return CutiLoadState(data: data ?? this.data, isLoading: isLoading ?? this.isLoading, date: date ?? this.date);
  }

  @override
  List<Object?> get props => [data, isLoading, date];
}
