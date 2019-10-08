import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();
}

class UserStateEmpty extends UserState {
  @override
  List<Object> get props => [];
}

class UserStateLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserStateSuccess extends UserState {
  final dynamic user;

  UserStateSuccess({@required this.user});

  @override
  List<Object> get props => [user];
}

class UserStateError extends UserState {
  final String error;

  UserStateError(this.error);

  @override
  List<Object> get props => [error];
}
