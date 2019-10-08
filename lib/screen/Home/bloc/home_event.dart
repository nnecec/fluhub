import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class EventsList extends HomeEvent {
  final String login;

  const EventsList({this.login});

  @override
  List<Object> get props => [login];
}
