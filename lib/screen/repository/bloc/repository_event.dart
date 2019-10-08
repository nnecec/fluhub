import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RepositoryEvent extends Equatable {
  const RepositoryEvent();
}

class RepositoryDetail extends RepositoryEvent {
  final String name;

  const RepositoryDetail({@required this.name});

  @override
  List<Object> get props => [name];
}
