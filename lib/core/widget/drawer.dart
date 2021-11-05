import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget getAppDrawer() {
  return Drawer(
    child: ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.new_label_sharp),
          title: const Text("News Headline"),
          onTap: () {
            Get.toNamed("/news_headline");
          },
        ),
        ListTile(
          leading: const Icon(Icons.search),
          title: const Text("Search News"),
          onTap: () {
            Get.toNamed("/search_news");

          },
        ),
      ],
    ),
  );
}
