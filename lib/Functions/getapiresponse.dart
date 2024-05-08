import 'package:mytodoapp/Models/postmodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<PostModel>?> getAPIresponse() async {
  var url = Uri.parse(
      'https://crudcrud.com/api/946ca780f7884ec68dad37ac98de2690/unicorns/');
  var response = await http.get(url);
  var responseBody = jsonDecode(response.body);
  List<PostModel> unicorns = [];
  for (var element in responseBody) {
    unicorns.add(PostModel.fromJson(element));
  }
  return unicorns;
}
