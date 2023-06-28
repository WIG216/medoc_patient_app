import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  final selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
    print(selectedIndex.value);
  }

}
