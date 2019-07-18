import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const []]) : super(props);
}

class Increment extends HomeEvent {
  @override
  String toString() => "Increment";
}

class Decrement extends HomeEvent {
  @override
  String toString() => "Decrement";
}
