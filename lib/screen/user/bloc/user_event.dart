import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserDetail extends UserEvent {
  final String login;

  UserDetail({@required this.login});

  @override
  List<Object> get props => [login];
}
