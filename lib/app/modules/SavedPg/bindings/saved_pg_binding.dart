import 'package:get/get.dart';

import '../controllers/saved_pg_controller.dart';

class SavedPgBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedPgController>(
      () => SavedPgController(),
    );
  }
}
