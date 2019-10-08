import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  @override
  TrendingState get initialState => InitialTrendingState();

  @override
  Stream<TrendingState> mapEventToState(
    TrendingEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
