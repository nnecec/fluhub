import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RootEvent extends Equatable {
  RootEvent([List props = const <dynamic>[]]) : super(props);
}
