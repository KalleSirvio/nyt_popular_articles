class ArticleModel {
  final String articleTitle;
  final String abstract;
  final String timeSincePublished;
  final String imageUrl;
  final String category;
  ArticleModel({required this.category, 
      required this.abstract,
      required this.timeSincePublished,
      required this.imageUrl,
      required this.articleTitle});
}
