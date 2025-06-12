import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginService {
  LoginService._privateConstructor();
  static final LoginService _instance = LoginService._privateConstructor();
  factory LoginService() => _instance;

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static const String _userIdKey = 'secure_user_id';
  static const String _userTypeKey = 'secure_user_type';
  static const String _jwtTokenKey = 'secure_jwt_token';
  static const String _refreshTokenKey = 'secure_refresh_token';

  Future<void> saveUserSession({
    required String userId,
    required String userType,
    required String jwtToken,
    required String refreshToken,
  }) async {
    await _secureStorage.write(key: _userIdKey, value: userId);
    await _secureStorage.write(key: _userTypeKey, value: userType);
    await _secureStorage.write(key: _jwtTokenKey, value: jwtToken);
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<String?> getUserId() async => _secureStorage.read(key: _userIdKey);
  Future<String?> getUserType() async => _secureStorage.read(key: _userTypeKey);
  Future<String?> getJwtToken() async => _secureStorage.read(key: _jwtTokenKey);
  Future<String?> getRefreshToken() async =>
      _secureStorage.read(key: _refreshTokenKey);

  Future<void> updateJwtToken(String newJwtToken) async {
    await _secureStorage.write(key: _jwtTokenKey, value: newJwtToken);
    print('JWT token updated.');
  }

  Future<void> updateRefreshToken(String newRefreshToken) async {
    await _secureStorage.write(key: _refreshTokenKey, value: newRefreshToken);
    print('Refresh token updated.');
  }

  Future<void> clearUserSession() async {
    await _secureStorage.delete(key: _userIdKey);
    await _secureStorage.delete(key: _userTypeKey);
    await _secureStorage.delete(key: _jwtTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
    print('User session cleared.');
  }

  Future<bool> isLoggedIn() async {
    return await _secureStorage.read(key: _jwtTokenKey) != null;
  }
}
