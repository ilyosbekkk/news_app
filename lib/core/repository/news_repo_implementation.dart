import 'package:news_app/core/model/article.dart';
import 'package:news_app/core/model/news_response.dart';
import 'package:news_app/core/repository/news_repository.dart';
import 'package:news_app/service/http_service.dart';
import 'package:get/get.dart';
import 'package:news_app/service/http_service_implementation.dart';

class NewsRepoImplementation implements NewsRepository {
  late HttpService _httpService;

  NewsRepoImplementation() {
    _httpService = Get.put(HttpServiceImplementation());
    _httpService.init();
  }

  @override
  Future<List<Article>?> getNewsHeadline() async {
    try {
      final response =
          await _httpService.getRequest("/v2/top-headlines?country=us");
      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }

  @override
  Future<List<Article>?> getSearchedNews(String query) async  {
    try {
      final response =
          await _httpService.getRequest("/v2/everything?q=$query");
      final parsedResponse = NewsResponse.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }
}
