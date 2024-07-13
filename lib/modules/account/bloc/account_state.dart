part of 'account_cubit.dart';

class AccountState extends Equatable {
  const AccountState({this.data, this.isLoading = true});

  final Account? data;
  final bool isLoading;

  AccountState copyWith({Account? data, bool? isLoading}) {
    return AccountState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [data, isLoading];
}
