import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/widget/drawer.dart';
import 'package:news_app/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineView extends StatelessWidget {
  const NewsHeadlineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsHeadlineController>();
    return Scaffold(
      appBar: AppBar(title: const Text("News Headline")),
      drawer: getAppDrawer(),
      body: Obx(() {
        return controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: const EdgeInsets.all(10),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "${controller.articles[index].urlToImage}",
                            placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                               const  Icon(Icons.error),
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
                    separatorBuilder: (context, index) => const Divider(
                          color: Colors.blue,
                        ),
                    itemCount: controller.articles.length),
              );
      }),
    );
  }
}
