import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nyt_popular_articles/Components/ArticleList.dart';
import 'package:nyt_popular_articles/Components/ArticleViewer.dart';
import 'package:nyt_popular_articles/Components/CategorySelector.dart';
import 'package:nyt_popular_articles/Controllers/DataFetcher.dart';
import 'package:nyt_popular_articles/Models/ArticleModel.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const MyApp(),
      '/article_viewer': (context) => const ArticleViewer(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    updateCategories(currentCategory);
    super.initState();
  }

  String currentCategory = "home";
  DataFetcher dataFetcher = DataFetcher();

  List<ArticleModel> articleModelList = [];
  Function(String) get changeCategory => (category) {
        debugPrint("Category changed to: $category");
        currentCategory = category;
        updateCategories(currentCategory);
      };

  void updateCategories(String category) {
    articleModelList.clear();
    dataFetcher.fetchArticles(currentCategory).then((response) {
      debugPrint(response.headers.values.toString());
      var data = jsonDecode(response.body);
      Iterable results = (data["results"]);
      for (var result in results) {
        if (result["title"] != null || result["title"] != "") {
          ArticleModel model = ArticleModel(
            articleTitle: result["title"] ?? "",
            abstract: result["abstract"] ?? "",
            articleUrl: result["url"] ?? "",
            category: result["subsection"] ?? "",
            imageUrl: result["multimedia"] != null
                ? result["multimedia"][0]["url"]
                : "",
            publishedDate: result["published_date"] ?? "",
          );
          articleModelList.add(model);
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("NY Times"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CategorySelector(selectCategory: (text) => changeCategory(text)),
            Expanded(child: ArticleList(articleModelList: articleModelList)),
          ],
        ),
      ),
    );
  }
}
