import 'package:dio/dio.dart';

class API {
  Dio dio;

  API() {
    dio = Dio();
  }
  get(String url, [Map<String, dynamic> query]) async {
    Response res = await dio.get(url, queryParameters: query);
    return res;
  }
}

final api = API();
