class Article {
  String articleId, title, description, body, contentUrl, sourceUrl,
      videoUrl, imageUrl, thumbUrl, authorId;
  int comments;
  List<dynamic> tags;

  Article(this.articleId, this.title, this.description, this.body,
      this.contentUrl, this.sourceUrl, this.videoUrl, this.imageUrl,
  this.thumbUrl, this.authorId, this.comments, this.tags);

  Article.fromJson(var value) {
    this.articleId = value['article_id'];
    this.title = value['title'];
    this.description = value['description'];
    this.body = value['body'];
    this.contentUrl = value['content_url'];
    this.sourceUrl = value['source_url'];
    this.videoUrl = value['video_url'];
    this.imageUrl = value['image_url'];
    this.thumbUrl = value['thumb_url'];
    this.authorId = value['author_id'];
    this.comments = value['comments'];
    this.tags = value['tags'];
  }
}
