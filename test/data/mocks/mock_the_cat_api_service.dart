import 'package:pragma_test/data/services/thecat_api_service.dart';

class MockTheCatApiService extends TheCatApiService {
  String? Function(String relativeUrl)? _getHandler;

  void mockGet(String? Function(String relativeUrl) handler) {
    _getHandler = handler;
  }

  @override
  Future<String?> get(dynamic relativeUrl) async {
    if (_getHandler != null) {
      return _getHandler!(relativeUrl);
    }
    return null;
  }
}
