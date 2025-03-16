import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String apiKey = dotenv.get('API_KEY');
  static String baererToken = dotenv.get('BEARER_TOKEN');
  static String baseUrl = dotenv.get('BASE_URL');
  static Map<String, String> get headers => {
        'Authorization': 'Bearer $baererToken',
        'accept': 'application/json',
      };
}
