import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class AppConfig {
  static const String baseUrl = "https://app.ecominnerix.com";
}

class ApiHelper {
  static Future<String?> postData({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse(AppConfig.baseUrl + endpoint);

    final allHeaders = {
      'Content-Type': 'application/json',
      ...?headers,
    };

    try {
      final response = await http.post(
        url,
        headers: allHeaders,
        body: jsonEncode(body),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body;
      } else {
        print("[log] Error: ${response.statusCode}");
        print("[log] Body: ${response.body}");
        return null;
      }
    } catch (e) {
      print("❌ Exception during POST: $e");
      return null;
    }
  }

  static Future<String?> getData({
    required String endpoint,
    Map<String, String>? queryParams,
  }) async {
    try {
      Uri uri = Uri.parse(AppConfig.baseUrl + endpoint);

      if (queryParams != null && queryParams.isNotEmpty) {
        uri = uri.replace(queryParameters: queryParams);
      }

      final response = await http.get(
        uri,
        headers: {
          'Cookie': 'fabrio_session=LLr4WT4IYbB3FOY2q472BjIiNo1Aqy51xDbgsuSB',
        },
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        log("GET Error: ${response.statusCode}");
        log("GET Body: ${response.body}");
      }
    } catch (e) {
      log("Exception in getData: $e");
    }
    return null;
  }

  static Future<String?> postJson({
    required String endpoint,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
  }) async {
    final url = Uri.parse(AppConfig.baseUrl + endpoint);
    final allHeaders = {
      'Content-Type': 'application/json',
      ...headers,
    };

    try {
      final response = await http.post(
        url,
        headers: allHeaders,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('❌ HTTP ${response.statusCode}: ${response.body}');
        return null;
      }
    } catch (e) {
      print('❗ Error in postJson: $e');
      return null;
    }
  }

  /// NEW: POST using form-data (for OTP request/verify)
  static Future<String?> postForm({
    required String endpoint,
    required Map<String, String> fields,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse(AppConfig.baseUrl + endpoint);
    final request = http.MultipartRequest('POST', uri);
    request.fields.addAll(fields);
    if (headers != null) request.headers.addAll(headers);

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body;
      } else {
        print('❌ Form POST failed ${response.statusCode}: ${response.body}');
        return null;
      }
    } catch (e) {
      print('❗ Exception in postForm: $e');
      return null;
    }
  }
}
