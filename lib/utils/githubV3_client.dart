import 'package:dio/dio.dart';
import '../store/store.dart';
import './storage.dart';
import '../screen/account/redux/action.dart';
import '../config/constant.dart';

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
    dio.interceptors.add(LogInterceptor(responseBody: false));
  }
  get(String url, [Map<String, dynamic> query = const {}]) async {
    try {
      Response res = await dio.get(url, queryParameters: query);
      return res.data;
    } catch (error) {
      print(error);
      if (error.response.statusCode == 401) {
        print('无权限');
        await LocalStorage.removeItem(Constant.TOKEN);
        store.dispatch(SetAccessTokenAction(''));
      }
    }
  }
}

final v3 = GitHubV3Client();
