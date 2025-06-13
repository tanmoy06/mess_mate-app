import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mess_mate/app/service/device_info_service.dart';
import 'package:mess_mate/app/service/login_service.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  Get.put<LoginService>(LoginService(), permanent: true);
  Get.put(DeviceInfoService());
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black),
        ),
        textTheme: ThemeData.light().textTheme,
      ),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
