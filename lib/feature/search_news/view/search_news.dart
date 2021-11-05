import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/widget/drawer.dart';
import 'package:news_app/feature/search_news/controller/search_news_controller.dart';

class SearchNews extends StatelessWidget {
  const SearchNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchNewsController>();
    return Scaffold(
      appBar: AppBar(title: const Text("Search News")),
      drawer: getAppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller.searchTextController,
            decoration: const InputDecoration(prefixIcon: Icon(Icons.search)),
          ),
          Expanded(child: Obx(() {
            return controller.isLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  ):

                controller.articles.isEmpty? const Center(child:  Text("No news found")):
                 ListView.separated(
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "${controller.articles[index].urlToImage}",
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${controller.articles[index].title}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${controller.articles[index].content}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: controller.articles.length);
          }))
        ],
      ),
    );
  }
}
