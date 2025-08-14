import 'dart:convert';
import 'package:ecom/core/network/api_helper.dart';
import 'package:ecom/model/product_res.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiService {
  static const _accessTokenKey = 'access_token';

  static Future<void> _saveAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, token);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse("${AppConfig.baseUrl}/api/login");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data.containsKey('access_token')) {
          await _saveAccessToken(data['access_token']);
        }
        return response.body;
      } else {
        print("Login failed: ${response.statusCode} ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception during login: $e");
      return null;
    }
  }
static String? _sessionCookie;

static Future<Map<String, dynamic>?> requestOtp({
  required String email,
  String? accessToken,
}) async {
  final uri = Uri.parse("${AppConfig.baseUrl}/api/request-otp");
  final request = http.MultipartRequest('POST', uri)
    ..fields['email'] = email;

  if (accessToken != null) {
    request.headers['Authorization'] = 'Bearer $accessToken';
  }

  final streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);

  // Capture session cookie
  final rawCookie = response.headers['set-cookie'];
  if (rawCookie != null) {
    _sessionCookie = rawCookie.split(';').first;
    print("Saved session cookie: $_sessionCookie");
  }

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }
  return null;
}

static Future<bool> verifyOtp({
  required String email,
  required String otp,
}) async {
  final uri = Uri.parse("${AppConfig.baseUrl}/api/verify-email-otp");
  final request = http.MultipartRequest('POST', uri)
    ..fields['email'] = email
    ..fields['otp'] = otp;

  // Send saved cookie
  if (_sessionCookie != null) {
    request.headers['Cookie'] = _sessionCookie!;
  }

  final streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);

  print("Response: ${response.body}");

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['status'] == true;
  }
  return false;
}


  static Future<ProductRes?> fetchProducts() async {
    try {
      final responseBody = await ApiHelper.getData(endpoint: "/api/v1/home");
      if (responseBody != null) {
        return ProductRes.fromJson(jsonDecode(responseBody));
      }
    } catch (e) {
      print("Exception in fetchProducts: $e");
    }
    return null;
  }
}
