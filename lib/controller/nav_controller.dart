import 'package:get/get.dart';

class NavController extends GetxController {
  //when click aloating button on navbar variable will updated
  RxBool addIcon = false.obs;

  changeFloatingIcon() {
    addIcon.value = !addIcon.value;
  }

  RxInt selectedIndex = 0.obs;

  changeIcon(int index) {
    selectedIndex.value = index;
  }
}
