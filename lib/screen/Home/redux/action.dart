import '../../../store/reducers.dart';

class HomeAction {
  final int page;

  HomeAction(this.page);

  @override
  String toString() {
    return 'HomeAction {page: $page}';
  }
}


