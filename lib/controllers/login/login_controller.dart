import 'package:get/get.dart';

class LoginController extends GetxController {
  bool _isPhoneSelected = true;

  updatePhoneNumberSelection(bool isSelected) {
    _isPhoneSelected = isSelected;
    update();
  }

  bool get isPhoneNumberSelected => _isPhoneSelected;
}
