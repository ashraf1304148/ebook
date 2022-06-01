class BookModel {
  String? id, rating, title, text, img, audio;
  BookModel({
    this.id,
    this.rating,
    this.title,
    this.text,
    this.img,
    this.audio,
  });

  BookModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.rating = json['rating'];
    this.title = json["title"];
    this.text = json["text"];
    this.img = json["img"];
    this.audio = json["audio"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["id"] = this.id;
    json["rating"] = this.rating;
    json["title"] = this.title;

    json["text"] = this.text;

    json["img"] = this.img;
    json["audio"] = this.audio;

    return json;
  }
}
