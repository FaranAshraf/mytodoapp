class GetModel {
  String? title;
  String? id;
  String? body;
  String? type;

  GetModel({
    required this.title,
    required this.id,
  });
  GetModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    id = json["_id"];
    body = json["body"];
    type = json["type"];
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data["title"] = title;
  //   return data;
  // }
}
