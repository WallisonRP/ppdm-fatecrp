import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get apiKeyWeb => _get('apiKeyWeb');
  static String get appIdWeb => _get('appId');
  static String get messagingSenderIdWeb => _get('messagingSenderIdWeb');
  static String get projectIdWeb => _get('projectIdWeb');
  static String get authDomainWeb => _get('authDomainWeb');
  static String get storageBucketWeb => _get('storageBucketWeb');
  static String get measurementIdWeb => _get('measurementIdWeb');

  static String get apiKey => _get('apiKey');
  static String get appId => _get('appId');
  static String get messagingSenderId => _get('messagingSenderId');
  static String get projectId => _get('projectId');
  static String get storageBucket => _get('storageBucket');

  static String _get(String name) => dotenv.env[name] ?? '';
}
