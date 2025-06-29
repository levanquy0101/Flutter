import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiConstants {
  // Base URL cho API
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  
  // Headers
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  
  // Timeout
  static const int requestTimeout = 30000; // 30 seconds
  
  // HTTP Client
  static final http.Client client = http.Client();
  
  // Helper methods
  static Future<http.Response> post(String endpoint, {Map<String, dynamic>? data}) {
    return client.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: defaultHeaders,
      body: data != null ? jsonEncode(data) : null,
    );
  }
  
  static Future<http.Response> get(String endpoint) {
    return client.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: defaultHeaders,
    );
  }
  
  static Future<http.Response> put(String endpoint, {Map<String, dynamic>? data}) {
    return client.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: defaultHeaders,
      body: data != null ? jsonEncode(data) : null,
    );
  }
  
  static Future<http.Response> delete(String endpoint) {
    return client.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: defaultHeaders,
    );
  }
} 