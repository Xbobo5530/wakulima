class Thread {
  String id, title, description, imageUrl, thumbUrl, authorId;
  int comments, votes;
  List<dynamic> tags;

  Thread(
      this.id, this.title, this.description, this.imageUrl,
      this.thumbUrl, this.authorId, this.comments, this.votes, this.tags
      );

  Thread.fromJson(var value){
    this.id = value['id'];
    this.title = value['title'];
    this.description = value['description'];
    this.imageUrl = value['image_url'];
    this.thumbUrl = value['thumb_url'];
    this.authorId = value['author_id'];
    this.comments = value ['comments'];
    this.votes = value['votes'];
    this.tags = value['tags'];
  }
}
