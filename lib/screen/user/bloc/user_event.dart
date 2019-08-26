import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserEvent extends Equatable {
  UserEvent([List props = const <dynamic>[]]) : super(props);
}

class GetUser extends UserEvent {
  final String login;

  GetUser({@required this.login}): super([login]);

  @override
  String toString() => 'GetUser { login: $login }';
}