import 'package:dio/dio.dart';
import 'package:news_app/service/http_service.dart';

// ignore: constant_identifier_names
const BASE_URL = "https://newsapi.org";
// ignore: constant_identifier_names
const API_KEY = "d14580254cc04eeeac6a65614717fb38";

class HttpServiceImplementation implements HttpService {
  late Dio _dio;

  @override
  Future<Response> getRequest(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e);
      throw Exception(e.message);
    }
    return response;
  }

  void  initilializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error, h) {
      print(error.response);
    }, 
    onRequest: (request, h) {
      print("${request.method}");
    },
     onResponse: (response, handler) {
      print("response");
      print("${response.statusCode}");
      print("${response.statusMessage}");
      print("${response.data}");
    }));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(baseUrl: BASE_URL, headers: {"Authorization": "Bearer $API_KEY"}));
    //initilializeInterceptors();
  }
}
