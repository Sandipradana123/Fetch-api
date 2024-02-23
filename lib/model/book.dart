import 'package:http/http.dart' as http;
import 'dart:convert';

class BookModel {
  static Future fetch() async {
    Uri url = Uri.parse("https://www.googleapis.com/books/v1/volumes?q=quilt&maxResults=1");
    var response = await http.get(url);

    var data = json.decode(response.body);
    print(data);
    return data['items'];
  }
}
