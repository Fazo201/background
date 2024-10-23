import "dart:convert";
import "dart:developer";

import "package:http/http.dart" as http;
import "package:http/http.dart";
import "package:http_parser/http_parser.dart";

class Api {
  // BaseUrl
  static const String baseUrl = "apilayer.net";

  // Apis
  static String apiConvert = "/api/convert";

  // Headers
  static Map<String, String> headers = <String, String>{
    "accept": "*/*",
    "Content-Type": "application/json",
    // "Accept": "application/json",
    // "Authorization": "Bearer $token",
  };

  // Methods
  static Future<String?> get({required String api, required Map<String, dynamic> params}) async {
    try {
      final Uri url = Uri.https(baseUrl, api, params);
      final http.Response response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      log("Api get: $e");
      return null;
    }
  }

  static Future<String?> post({required String api, Map<String, dynamic>? body, Map<String, dynamic>? param}) async {
    try {
      final Uri url = Uri.https(baseUrl, api, param);
      final http.Response response = await http.post(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      log("Api post: $e");
      return null;
    }
  }

  static Future<String?> put({required String api, required Map<String, dynamic> body, required Map<String, dynamic> param}) async {
    try {
      final Uri url = Uri.https(baseUrl, api, param);
      final http.Response response = await http.put(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      log("Api put: $e");
      return null;
    }
  }

  static Future<String?> multipart(String api, String filePath, Map<String, String> body) async {
    try {
      final Uri uri = Uri.http(baseUrl, api);
      final http.MultipartRequest request = MultipartRequest("POST", uri);
      request.headers.addAll(headers);
      request.files.add(await MultipartFile.fromPath("file", filePath, contentType: MediaType("file", "png")));
      request.fields.addAll(body);
      final StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.stream.bytesToString();
      } else {
        return response.reasonPhrase;
      }
    } catch (e) {
      log("Api multipart: $e");
      return null;
    }
  }

  static Future<String?> patch(String api, Map<String, String> params, Map<String, dynamic> body) async {
    try {
      final Uri url = Uri.http(baseUrl, api);
      final http.Response response = await http.patch(url, headers: headers, body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      log("Api patch: $e");
      return null;
    }
  }

  static Future<String?> delete(String api, Map<String, String> params) async {
    try {
      final Uri url = Uri.http(baseUrl, api, params);
      final http.Response response = await http.delete(url, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      log("Api delete: $e");
      return null;
    }
  }

  /// params
  static Map<String, String> emptyParams() => <String, String>{};

  /// body
  static Map<String, dynamic> bodyEmpty() => <String, dynamic>{};
}
