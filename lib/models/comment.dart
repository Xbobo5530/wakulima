class Comment {
  String commentId, userId, username, userImageUrl, comment;

  Comment(this.commentId, this.userId, this.username, this.userImageUrl,
      this.comment);

  Comment.fromJson(var value) {
    this.commentId = value['comment_id'];
    this.userId = value['user_id'];
    this.username = value['username'];
    this.userImageUrl = value['user_image_url'];
    this.comment = value['comment'];
  }
}
