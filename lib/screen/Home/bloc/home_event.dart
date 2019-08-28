import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const <dynamic>[]]) : super(props);
}

class EventsList extends HomeEvent {
  final String login;

  EventsList({@required this.login}): super([login]);

  @override
  String toString() => 'EventsList { login: $login }';
}