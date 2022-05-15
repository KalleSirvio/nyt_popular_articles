import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  final String articleTitle;
  final String abstract;
  final String imageUrl;
  final String timeSincePublished;

  const Article(
      {Key? key,
      required this.articleTitle,
      required this.abstract,
      required this.timeSincePublished,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double imageSize = 50;
    const double padding = 10;
    const double textAreaWidth = 285;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: padding, right: padding),
            child: SizedBox(
              height: imageSize,
              width: imageSize,
              child: Image.network(
                  fit: BoxFit.cover, alignment: Alignment.topLeft, imageUrl),
            ),
          ),
        ),
        Container(
          width: textAreaWidth,
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: textAreaWidth,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        articleTitle),
                    Text(
                        style: TextStyle(color: Colors.grey[500]),
                        textAlign: TextAlign.end,
                        timeSincePublished),
                  ],
                ),
              ),
              LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                clipBehavior: Clip.hardEdge,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(top: padding, bottom: padding),
                        child: Text(abstract, overflow: TextOverflow.clip),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey
                    )
                  ],
                ),
              );
              })
            ],
          ),
        ),
      ],
    );
  }
}
