class PostModel {
  String? title;
  String? id;
  String? body;
  String? type;

  PostModel({
    required this.title,
    required this.id,
  });
  PostModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    id = json["_id"];
    body = json["body"];
    type = json["type"];
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data["name"] = name;
  //   return data;
  // }
}
