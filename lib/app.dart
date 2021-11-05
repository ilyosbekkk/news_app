import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/feature/news_headline/binding/news_headline_binding.dart';
import 'package:news_app/feature/news_headline/view/news_headline_screen.dart';
import 'package:news_app/feature/search_news/binding/search_news_binding.dart';
import 'package:news_app/feature/search_news/view/search_news.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       primarySwatch: Colors.blue,
      ),
      
      getPages: [
        GetPage(name: "/news_headline", page: () =>  NewsHeadlineView(), binding: NewsHeadlineBinding()),
        GetPage(name: "/search_news", page: () =>  SearchNews(), binding: SearchNewsBinding())

      ],

     initialRoute: "/news_headline",

    );
  }
}
