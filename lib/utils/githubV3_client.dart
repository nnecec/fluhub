import 'package:dio/dio.dart';
import '../store/store.dart';

class GitHubV3Client {
  Dio dio;

  GitHubV3Client() {
    final accessToken = store.state.accessToken;
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.github.com',
        headers: {'Authorization': 'token $accessToken'},
      ),
    );
  }
  get(String url, [Map<String, dynamic> query]) async {
    Response res = await dio.get(url, queryParameters: query);
    return res;
  }
}

final v3 = GitHubV3Client();
