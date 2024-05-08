import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> postAPIresponse(
    {required String name, required String body}) async {
  var url = Uri.parse(
      'https://crudcrud.com/api/946ca780f7884ec68dad37ac98de2690/unicorns/');

  // Encode the object to JSON

  await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{'name': name, "body": body}),
  );
}
