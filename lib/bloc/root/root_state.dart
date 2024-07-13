part of 'root_cubit.dart';

abstract class RootState extends Equatable {
  const RootState();
}

class RootInitialize extends RootState {
  @override
  List<Object> get props => [];
}

class RootSplashScreen extends RootState {
  @override
  List<Object> get props => [];
}

class RootMain extends RootState {
  @override
  List<Object> get props => [];
}

class RootAuth extends RootState {
  @override
  List<Object> get props => [];
}

class RootAuthDestroy extends RootState {
  final int count;
  const RootAuthDestroy(this.count);
  @override
  List<Object> get props => [count];
}
