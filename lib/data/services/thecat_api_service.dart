import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pragma_test/data/services/rest_service.dart';

class TheCatApiService extends RestService {
  TheCatApiService() : super(hostUrl: dotenv.env['BASE_URL']!);

  @override
  Future<Map<String, String>> headers() async {
    return {
      "x-api-key": dotenv.env['API_KEY']!,
      "Content-type": "application/json; charset=utf-8",
    };
  }
}
