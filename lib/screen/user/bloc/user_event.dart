import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserEvent extends Equatable {
  UserEvent([List props = const <dynamic>[]]) : super(props);
}

class UserDetail extends UserEvent {
  final String login;

  UserDetail({@required this.login}): super([login]);

  @override
  String toString() => 'UserDetail { login: $login }';
}