part of 'spl_load_cubit.dart';

class SplLoadState extends Equatable {
  SplLoadState({this.data, this.isLoading = true, this.date});

  final SplList? data;
  final bool isLoading;
  final DateTime? date;

  SplLoadState copyWith({SplList? data, bool? isLoading, DateTime? date}) {
    return SplLoadState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [data, isLoading, date];
}
