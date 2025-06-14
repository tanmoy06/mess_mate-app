import 'package:get/get.dart';
import 'package:mess_mate/app/modules/Booking/views/booking_view.dart';
import 'package:mess_mate/app/modules/SavedPg/views/saved_pg_view.dart';
import 'package:mess_mate/app/modules/UserProfile/views/user_profile_view.dart';
import 'package:mess_mate/app/modules/User_Home/views/user_home_view.dart';

class NavBarController extends GetxController {
  var currentIndex = 0.obs;
  final pages = [
    const UserHomeView(),
    SavedPgView(),
    const BookingView(),
    UserProfileView(),
  ];
  void changeIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
