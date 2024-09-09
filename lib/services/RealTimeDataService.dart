// lib/services/RealTimeDataService.dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class RealTimeDataService {
  final String _baseUrl = 'https://api.example.com';
  final bool useMockData = true;

  Future<List<String>> fetchRealTimeUpdates() async {
    try {
      if (useMockData) {
        final String response = await rootBundle
            .loadString('lib/assets/mock_real_time_updates.json');
        List<dynamic> data = jsonDecode(response);
        return data.cast<String>();
      } else {
        final response =
            await http.get(Uri.parse('$_baseUrl/real-time-updates'));
        if (response.statusCode == 200) {
          List<dynamic> data = jsonDecode(response.body);
          return data.cast<String>();
        } else {
          throw HttpException('Failed to load real-time updates',
              uri: Uri.parse('$_baseUrl/real-time-updates'));
        }
      }
    } catch (error) {
      print('Error fetching real-time updates: $error');
      throw error; // Rethrow to be handled by the widget
    }
  }
}
