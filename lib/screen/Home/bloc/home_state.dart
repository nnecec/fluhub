import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const []]) : super(props);
}

class HomeLoading extends HomeState {
  @override
  String toString() => 'HomeLoading';
}

class HomeLoaded extends HomeState {
  final count;

  HomeLoaded([this.count]) : super([count]);

  @override
  String toString() => 'HomeLoaded { count: $count }';
}

class HomeNotLoaded extends HomeState {
  @override
  String toString() => 'HomeNotLoaded';
}
