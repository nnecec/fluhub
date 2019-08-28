import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const <dynamic>[]]) : super(props);
}

class HomeStateEmpty extends HomeState {
  @override
  String toString() => 'HomeStateEmpty';
}

class HomeStateLoading extends HomeState {
  @override
  String toString() => 'HomeStateLoading';
}

class HomeStateSuccess extends HomeState {
  final dynamic events;

  HomeStateSuccess({@required this.events}) : super([events]);

  @override
  String toString() => 'HomeStateSuccess';
}

class HomeStateError extends HomeState {
  final error;

  HomeStateError(this.error) : super([error]);

  @override
  String toString() => 'HomeStateError';
}
