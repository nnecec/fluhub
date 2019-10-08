import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeStateEmpty extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeStateLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeStateSuccess extends HomeState {
  final dynamic events;

  const HomeStateSuccess({this.events});

  @override
  List<Object> get props => [events];
}

class HomeStateError extends HomeState {
  final error;

  const HomeStateError(this.error);

  @override
  List<Object> get props => [error];
}
