import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  static final DeviceInfoService _instance = DeviceInfoService._internal();
  factory DeviceInfoService() => _instance;
  DeviceInfoService._internal();

  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  Future<Map<String, dynamic>> getDeviceInfoMap() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfoPlugin.androidInfo;
        return {
          'device': 'Android',
          'model': androidInfo.model,
          'manufacturer': androidInfo.manufacturer,
          'version': androidInfo.version.release,
          'sdkInt': androidInfo.version.sdkInt,
        };
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfoPlugin.iosInfo;
        return {
          'device': 'iOS',
          'model': iosInfo.utsname.machine,
          'systemName': iosInfo.systemName,
          'systemVersion': iosInfo.systemVersion,
          'name': iosInfo.name,
        };
      }
      return {'device': 'Unknown'};
    } catch (e) {
      return {'device': 'Error', 'message': e.toString()};
    }
  }

  Future<String> getNormalizedDeviceInfo() async {
    final infoMap = await getDeviceInfoMap();

    final device = infoMap['device'] ?? 'Unknown';
    final manufacturer = infoMap['manufacturer'] ?? 'Unknown';
    final model = infoMap['model'] ?? 'Unknown';
    final version = infoMap['version'] ?? 'Unknown';

    return '$device-$manufacturer-$model-$version';
  }
}
