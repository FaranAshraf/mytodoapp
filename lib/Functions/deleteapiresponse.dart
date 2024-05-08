import 'package:http/http.dart' as http;

Future<void> deleteAPI({required String? id}) async {
  var url = Uri.parse(
      "https://crudcrud.com/api/946ca780f7884ec68dad37ac98de2690/unicorns/$id");

  await http.delete(url);
}
