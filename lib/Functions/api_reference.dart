import 'package:mytodoapp/Models/getmodel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIReferences {
  static String endpoint = 'd7ed4d188de24399aa086a55486b6179';
  static Future<GetModel>? getSingleTask({required String id}) async {
    var url = Uri.parse('https://crudcrud.com/api/$endpoint/tasks/$id');
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    return GetModel.fromJson(responseBody);
  }

  static Future<List<GetModel>?> getAPIresponse() async {
    var url = Uri.parse('https://crudcrud.com/api/$endpoint/tasks/');
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    List<GetModel> unicorns = [];
    for (var element in responseBody) {
      unicorns.add(GetModel.fromJson(element));
    }
    return unicorns;
  }

  static postAPIresponse(
      {required String title,
      required String body,
      required String type}) async {
    var url = Uri.parse('https://crudcrud.com/api/$endpoint/tasks/');

    // Encode the object to JSON

    await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, dynamic>{"title": title, "body": body, "type": type}),
    );
  }

  static putAPI({
    required String id,
    required String title,
    required String body,
    required String type,
  }) async {
    var url = Uri.parse("https://crudcrud.com/api/$endpoint/tasks/$id");

    await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, dynamic>{"title": title, "body": body, "type": type}),
    );
  }

  static deleteAPI({required String? id}) async {
    var url = Uri.parse("https://crudcrud.com/api/$endpoint/tasks/$id");

    await http.delete(url);
  }
}
