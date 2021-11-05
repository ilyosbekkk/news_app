import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/core/repository/news_repo_implementation.dart';
import 'package:news_app/core/repository/news_repository.dart';
import 'package:news_app/core/model/article.dart';

class SearchNewsController extends GetxController {
  late NewsRepository _newsRepository;

  SearchNewsController() {
    _newsRepository = Get.find<NewsRepoImplementation>();
    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.isNotEmpty) {
        searchNewsHeadline();
      }
    });
  }

  TextEditingController searchTextController = TextEditingController();
  RxBool isLoading = false.obs;
  RxList<Article> articles = RxList();

  searchNewsHeadline() async {
    showLoading();
    final result =
        await _newsRepository.getSearchedNews(searchTextController.text);
    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      print("No Data");
    }
  }

  void showLoading() {
    isLoading.toggle();
  }

  void hideLoading() {
    isLoading.toggle();
  }
}
