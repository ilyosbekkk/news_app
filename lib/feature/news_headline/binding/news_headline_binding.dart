import 'package:get/get.dart';
import 'package:news_app/core/repository/news_repo_implementation.dart';
import 'package:news_app/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImplementation());
    Get.put(NewsHeadlineController());
  }
}
