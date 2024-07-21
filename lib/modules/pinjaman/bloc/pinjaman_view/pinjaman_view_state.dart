part of 'pinjaman_view_cubit.dart';

class PinjamanViewState extends Equatable {
  PinjamanViewState({this.data, this.isLoading = true});

  final AngsuranList? data;
  final bool isLoading;
  final formKey = GlobalKey<FormBuilderState>();

  PinjamanViewState copyWith({AngsuranList? data, bool? isLoading}) {
    return PinjamanViewState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [data, isLoading];
}
