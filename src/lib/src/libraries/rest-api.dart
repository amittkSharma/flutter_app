import 'package:http/http.dart' as http;

class RestApi {
  final _severName = 'https://jsonplaceholder.typicode.com';

  Future<http.Response> getAll(String endPoint) {
    return http.get(_severName + endPoint);
  }
}
