import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtil {

  static final BASE_URL = "https://nu2morrow.com/crm/apis/";

  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url,
      {Map<String, String> headers, encoding, String baseURL}) {
    return http
        .get(
      baseURL == null ? BASE_URL + url : baseURL,
      headers: headers,
    )
        .then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        throw new Exception(statusCode);
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url,
      {Map<String, String> headers, body, encoding, String baseURL}) {
    return http
        .post(baseURL == null ? (BASE_URL + url) : baseURL,
        body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      print("\n\n\n\API Response: " + res + "\n\n\n");
      /* if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        throw new Exception(statusCode);
      }*/
      return _decoder.convert(res);
    });
  }
}