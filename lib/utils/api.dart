import 'package:dio/dio.dart';

class API {
  Dio dio;

  API() {
    dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: false));
  }
  get(String url, [Map<String, dynamic> query]) async {
    try {
      Response res = await dio.get(url, queryParameters: query);
      return res;
    } catch (error) {
      print(error);
    }
  }
}

final api = API();
