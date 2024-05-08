class PostModel {
  String? name;
  String? id;
  String? body;

  PostModel({required this.name, required this.id});
  PostModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    id = json["_id"];
    body = json["body"];
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data["name"] = name;
  //   return data;
  // }
}
