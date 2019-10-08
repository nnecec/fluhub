import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RepositoryState extends Equatable {
  const RepositoryState();
}

class RepositoryStateEmpty extends RepositoryState {
  @override
  List<Object> get props => [];
}

class RepositoryStateLoading extends RepositoryState {
  @override
  List<Object> get props => [];
}

class RepositoryStateSuccess extends RepositoryState {
  final dynamic repository;

  const RepositoryStateSuccess({@required this.repository});

  @override
  List<Object> get props => [repository];
}

class RepositoryStateError extends RepositoryState {
  final error;

  RepositoryStateError(this.error);

  @override
  List<Object> get props => [error];
}
