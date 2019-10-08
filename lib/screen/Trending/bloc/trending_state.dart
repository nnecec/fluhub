import 'package:equatable/equatable.dart';

abstract class TrendingState extends Equatable {
  const TrendingState();
}

class InitialTrendingState extends TrendingState {
  @override
  List<Object> get props => [];
}
