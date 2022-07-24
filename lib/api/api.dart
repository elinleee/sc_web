import 'package:http/http.dart' as http;

class MyApi {
  Object _callAPI() async {
    var url = Uri.parse("http://localhost:3011/local/menus");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }
}
