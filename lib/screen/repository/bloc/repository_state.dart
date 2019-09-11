import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RepositoryState extends Equatable {
  RepositoryState([List props = const <dynamic>[]]) : super(props);
}

class RepositoryStateEmpty extends RepositoryState {
  @override
  String toString() => 'RepositoryStateEmpty';
}

class RepositoryStateLoading extends RepositoryState {
  @override
  String toString() => 'RepositoryStateLoading';
}

class RepositoryStateSuccess extends RepositoryState {
  final dynamic repository;

  RepositoryStateSuccess({@required this.repository}) : super([repository]);

  @override
  String toString() => 'RepositoryStateSuccess';
}

class RepositoryStateError extends RepositoryState {
  final error;

  RepositoryStateError(this.error) : super([error]);

  @override
  String toString() => 'RepositoryStateError';
}
