import '../../../store/reducers.dart';

class SetAccessTokenAction {
  final String accessToken;

  SetAccessTokenAction(this.accessToken);

  @override
  String toString() {
    return 'SetAccessTokenAction {accessToken: $accessToken}';
  }
}


