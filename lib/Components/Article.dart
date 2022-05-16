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
    const double titleHeight = 30;
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
              child: imageUrl != ""
                  ? Image.network(
                      fit: BoxFit.cover, alignment: Alignment.topLeft, imageUrl)
                  : Image.network(
                      "https://1000logos.net/wp-content/uploads/2017/04/Symbol-New-York-Times-387x500.png"),
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
                height: titleHeight,
                width: textAreaWidth,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                          textAlign: TextAlign.start,
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          articleTitle),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                          style: TextStyle(color: Colors.grey[500]),
                          textAlign: TextAlign.end,
                          timeSincePublished),
                    ),
                  ],
                ),
              ),
              LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
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
                          padding: const EdgeInsets.only(
                              top: padding, bottom: padding),
                          child: Text(
                            abstract, 
                            overflow: TextOverflow.clip),
                        ),
                      ),
                      const Divider(color: Colors.grey)
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
