import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> putAPI({
  required String id,
  required String name,
  required String body,
}) async {
  var url = Uri.parse(
      "https://crudcrud.com/api/946ca780f7884ec68dad37ac98de2690/unicorns/$id");

  await http.put(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{'name': name, "body": body}),
  );
}
