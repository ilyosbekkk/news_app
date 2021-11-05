import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:news_app/core/repository/news_repo_implementation.dart';
import 'package:news_app/core/repository/news_repository.dart';
import 'package:news_app/core/model/article.dart';

class NewsHeadlineController extends GetxController {
  late NewsRepository _newsRepository;

  NewsHeadlineController() {
    print("Init");
    
    _newsRepository = Get.find<NewsRepoImplementation>();
    loadNewsHeadLine();
  }

  RxBool isLoading = false.obs;
  RxList<Article> articles = RxList();
  Future loadNewsHeadLine() async {
    showLoading();
    final result = await _newsRepository.getNewsHeadline();
    hideLoading();
    if (result != null) {
      articles = result.obs;
      print("length: ${articles![0].content}");
    } else {
      // ignore: avoid_print
      print("Empty List");
    }
  }

  void showLoading() {
    isLoading.toggle();
  }

  void hideLoading() {
    isLoading.toggle();
  }
}
