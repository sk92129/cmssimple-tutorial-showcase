import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CmsRepository {
  static Future<List<dynamic>> fetchCmsContent(
    String securityKey,
    String baseUrl,
    String schemaName,
  ) async {
    Map<String, String> headers = <String, String>{};
    String url = baseUrl + schemaName;

    url = "$url?zpw=$securityKey";

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
      } else {
        debugPrint(response.body);
        throw Exception('Failed to cms content');
      }

      List<dynamic> list = json.decode(response.body);

      return list;
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
