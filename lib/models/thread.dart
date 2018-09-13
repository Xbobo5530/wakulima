class Thread {
  String id, title, description, imageUrl, thumbUrl, authorId, username, userImageUrl;
  int commentCount, voteCount, isOpen /*thread status, shows is the thread is open or closed*/;
  List<dynamic> tags, comments;

  Thread(
      this.id, this.title, this.description, this.imageUrl,
      this.thumbUrl, this.authorId, this.username, this.userImageUrl,
      this.commentCount, this.voteCount, this.tags, this.comments
      );

  Thread.fromJson(var value){
    this.id = value['id'];
    this.title = value['title'];
    this.description = value['description'];
    this.imageUrl = value['image_url'];
    this.thumbUrl = value['thumb_url'];
    this.authorId = value['author_id'];
    this.username = value['username'];
    this.userImageUrl = value['user_image_url'];
    this.commentCount = value ['comment_count'];
    this.voteCount = value['vote_count'];
    this.tags = value['tags'];
    this.comments = value['comments'];
  }
}
