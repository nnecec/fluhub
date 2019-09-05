import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RootState extends Equatable {
  RootState([List props = const <dynamic>[]]) : super(props);
}

class InitialRootState extends RootState {}
