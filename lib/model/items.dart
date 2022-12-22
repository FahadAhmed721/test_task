class Item {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  String? error;

  Item({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Item.withError(String errorMessage) {
    error = errorMessage;
  }

  Item.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
