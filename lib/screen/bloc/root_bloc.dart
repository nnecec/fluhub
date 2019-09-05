import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  @override
  RootState get initialState => InitialRootState();

  @override
  Stream<RootState> mapEventToState(
    RootEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
