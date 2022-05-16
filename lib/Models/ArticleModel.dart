class ArticleModel {
  final String articleTitle;
  final String abstract;
  final String publishedDate;
  final String imageUrl;
  final String category;
  final String articleUrl;

  ArticleModel(
      {required this.articleUrl,
      required this.category,
      required this.abstract,
      required this.publishedDate,
      required this.imageUrl,
      required this.articleTitle});
}