import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/user.dart';

@immutable
abstract class UserState extends Equatable {
  UserState([List props = const <dynamic>[]]) : super(props);
}

class UserStateEmpty extends UserState {
  @override
  String toString() => 'UserStateEmpty';
}

class UserStateLoading extends UserState {
  @override
  String toString() => 'UserStateLoading';
}

class UserStateSuccess extends UserState {
  final dynamic user;

  UserStateSuccess({@required this.user}) : super([user]);
  @override
  String toString() => 'UserStateSuccess';
}

class UserStateError extends UserState {
  final String error;

  UserStateError(this.error) : super([error]);

  @override
  String toString() => 'UserStateError';
}
