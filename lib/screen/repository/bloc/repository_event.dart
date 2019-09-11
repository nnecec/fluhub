import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RepositoryEvent extends Equatable {
  RepositoryEvent([List props = const <dynamic>[]]) : super(props);
}

class RepositoryDetail extends RepositoryEvent {
  final String name;

  RepositoryDetail({
    @required this.name,
  }) : super([name]);

  @override
  String toString() => 'EventsList { name: $name }';
}
