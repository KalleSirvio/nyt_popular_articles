import 'package:flutter/material.dart';
import 'package:nyt_popular_articles/Components/ArticleList.dart';
import 'package:nyt_popular_articles/Components/CategorySelector.dart';
import 'package:nyt_popular_articles/Models/ArticleModel.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ArticleModel> articleModelList = [
    ArticleModel(
      articleTitle: "Article title",
      abstract: "Lorem ipsum jdnfvcsökj sdvjklnsdvjknösd jknk okjnköjdsnvsökjv kjnöncvkönj ökjnvökjv nökjlond njdscökjlcvsoökjsnvös jnnjsdv öjksdöj vnsönsdövsndv nsdv",
      timeSincePublished: "8m ago",
      imageUrl:"https://www.aviary.org/wp-content/uploads/2020/09/owl-o-ween-for-web-e1602272060600.png",
      category: "Category",
    ),
    ArticleModel(
      articleTitle: "Article title",
      abstract: "Lorem ipsum jdnfvcsökj sdvjklnsdvjknösd jknk okjnköjdsnvsökjv kjnöncvkönj ökjnvökjv nökjlond njdscökjlcvsoökjsnvös jnnjsdv öjksdöj vnsönsdövsndv nsdv",
      timeSincePublished: "8m ago",
      imageUrl:"https://www.aviary.org/wp-content/uploads/2020/09/owl-o-ween-for-web-e1602272060600.png",
      category: "Category",
    ),
    ArticleModel(
      articleTitle: "Article title",
      abstract: "Lorem ipsum jdnfvcsökj sdvjklnsdvjknösd jknk okjnköjdsnvsökjv kjnöncvkönj ökjnvökjv nökjlond njdscökjlcvsoökjsnvös jnnjsdv öjksdöj vnsönsdövsndv nsdv",
      timeSincePublished: "8m ago",
      imageUrl:"https://www.aviary.org/wp-content/uploads/2020/09/owl-o-ween-for-web-e1602272060600.png",
      category: "Category",
    ),
    ArticleModel(
      articleTitle: "Article title",
      abstract: "Lorem ipsum jdnfvcsökj sdvjklnsdvjknösd jknk okjnköjdsnvsökjv kjnöncvkönj ökjnvökjv nökjlond njdscökjlcvsoökjsnvös jnnjsdv öjksdöj vnsönsdövsndv nsdv",
      timeSincePublished: "8m ago",
      imageUrl:"https://www.aviary.org/wp-content/uploads/2020/09/owl-o-ween-for-web-e1602272060600.png",
      category: "Category",
    ),
    ArticleModel(
      articleTitle: "Article title",
      abstract: "Lorem ipsum jdnfvcsökj sdvjklnsdvjknösd jknk okjnköjdsnvsökjv kjnöncvkönj ökjnvökjv nökjlond njdscökjlcvsoökjsnvös jnnjsdv öjksdöj vnsönsdövsndv nsdv",
      timeSincePublished: "8m ago",
      imageUrl:"https://www.aviary.org/wp-content/uploads/2020/09/owl-o-ween-for-web-e1602272060600.png",
      category: "Category",
    ),
    ArticleModel(
      articleTitle: "Article title",
      abstract: "Lorem ipsum",
      timeSincePublished: "8m ago",
      imageUrl:"https://www.aviary.org/wp-content/uploads/2020/09/owl-o-ween-for-web-e1602272060600.png",
      category: "Category",
    ),
  ];
  Function(String) get changeCategory => (category) {
        debugPrint("Category changed to: $category");
      };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
      ),
    );
  }
}
