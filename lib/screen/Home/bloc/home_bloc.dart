import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeLoaded(0);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is Increment) {
      var count = (currentState as HomeLoaded).count;
      yield HomeLoaded(count + 1);
    } else if (event is Decrement) {
      var count = (currentState as HomeLoaded).count;
      yield HomeLoaded(count - 1);
    }
  }
}
