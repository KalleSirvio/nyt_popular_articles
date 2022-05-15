import 'package:flutter/material.dart';
import 'package:nyt_popular_articles/Components/Article.dart';
import 'package:nyt_popular_articles/Components/HighlightedArticle.dart';
import 'package:nyt_popular_articles/Models/ArticleModel.dart';

class ArticleList extends StatefulWidget {
  final List<ArticleModel> articleModelList;
  const ArticleList({Key? key, required this.articleModelList}) : super(key: key);

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  static const double itemPadding = 8;
  static const double itemHeight = 150;
  static const double listHeight = 477;
  List<SizedBox> createArticleList(List<ArticleModel> articles) {
    List<SizedBox> articleBoxes = [];
    int index = 0;
    for (ArticleModel articleModel in articles) {
      if (index % 3 == 0 && index != 0) {
        articleBoxes.add(
          SizedBox(
            child: HighlightedArticle(
              articleTitle: articleModel.articleTitle, 
              category: articleModel.category, 
              imageUrl: articleModel.imageUrl, 
              timeSincePublished: articleModel.timeSincePublished),
              ));
      } else {}
      articleBoxes.add(
        SizedBox(
          child: Article(
              articleTitle: articleModel.articleTitle,
              abstract: """${articleModel.abstract}""",
              timeSincePublished: articleModel.timeSincePublished,
              imageUrl: articleModel.imageUrl),
        ),
      );
      index++;
    }
    return articleBoxes;
  }

  @override
  Widget build(BuildContext context) {
    List<SizedBox> articleList = createArticleList(widget.articleModelList);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SizedBox(
          height: listHeight,
          child: ListView.builder(
            itemCount: articleList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                height: articleList[index].height,
                padding: const EdgeInsets.all(itemPadding),
                child: articleList[index],
              );
            },
          ),
        );
      }
    );
  }
}
