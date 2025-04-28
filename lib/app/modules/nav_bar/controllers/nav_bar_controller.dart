import 'package:get/get.dart';
import 'package:mess_mate/app/modules/Booking/views/booking_view.dart';
import 'package:mess_mate/app/modules/SavedPg/views/saved_pg_view.dart';
import 'package:mess_mate/app/modules/UserProfile/views/user_profile_view.dart';
import 'package:mess_mate/app/modules/home/views/home_view.dart';

class NavBarController extends GetxController {
  var currentIndex = 0.obs;
  final pages = [
    const HomeView(),
    const SavedPgView(),
    const BookingView(),
    const UserProfileView(),
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
