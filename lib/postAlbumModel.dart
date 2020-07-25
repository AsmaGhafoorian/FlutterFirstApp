class postAlbum {
  final int id;
  final String title;

  postAlbum({this.id, this.title});

  factory postAlbum.fromJson(Map<String, dynamic> json) {
    return postAlbum(
      id: json['id'],
      title: json['title'],
    );
  }
}