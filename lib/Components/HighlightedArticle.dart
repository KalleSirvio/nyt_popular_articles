import 'package:flutter/material.dart';

class HighlightedArticle extends StatelessWidget {
  final String articleTitle;
  final String category;
  final String imageUrl;
  final String timeSincePublished;
  const HighlightedArticle(
      {Key? key,
      required this.articleTitle,
      required this.category,
      required this.imageUrl,
      required this.timeSincePublished})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double imageSize = 1000;
    const double padding = 10;
    return SizedBox(
      height: 270,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: padding, right: padding),
                child: SizedBox(
                  width: imageSize,
                  child: Image.network(
                      fit: BoxFit.fitWidth, alignment: Alignment.center, imageUrl),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                padding: const EdgeInsets.only(left: padding),
                child: SizedBox(
                  width: imageSize,
                  child: Text(
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold

                    ),
                  articleTitle),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: padding, right: padding),
                child: SizedBox(
                        width: imageSize,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                style: const TextStyle(color: Colors.blue,),
                                category),
                            Text(
                                style: TextStyle(color: Colors.grey[500]),
                                textAlign: TextAlign.end,
                                timeSincePublished),
                          ],
                        ),
                      ),
              ),
            const Padding(
              padding: EdgeInsets.only(left: padding + 60, right: padding),
              child: Divider(color: Colors.grey),
            )
          ]),
        )],
      ),
    );
  }
}
