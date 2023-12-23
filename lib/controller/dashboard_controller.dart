import 'package:get/get.dart';

class DashBoardController extends GetxController {
  RxString dropdownvalue = 'Weekly'.obs;

  changeDropValue(String newValue) {
    dropdownvalue.value = newValue;
  }

 // List of boolean values to track checkbox states
  RxList<bool> checkboxValues = <bool>[false, false, false].obs;

  // Method to update individual checkbox state by index
  void checkBoxUpdate(int index, bool value) {
    checkboxValues[index] = value;
  }
}
