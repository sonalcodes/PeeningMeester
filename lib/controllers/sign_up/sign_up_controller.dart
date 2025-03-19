import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool _isPhoneSelected = true;

  List<Map<String, dynamic>> _goals = [
    {'title': 'I want to (text)', 'isSelected': false},
    {'title': 'I want to (text)', 'isSelected': false},
    {'title': 'I want to (text)', 'isSelected': false},
    {'title': 'I want to (text)', 'isSelected': false},
    {'title': 'I want to (text)', 'isSelected': false},
    {'title': 'I want to (text)', 'isSelected': false},
    {'title': 'I want to (text)', 'isSelected': false},
    {'title': 'I want to (text)', 'isSelected': false},
    {'title': 'I want to (text)', 'isSelected': false},
    {'title': 'I want to (text)', 'isSelected': false},
    {'title': 'I want to (text)', 'isSelected': false},
  ];

  updatePhoneNumberSelection(bool isSelected) {
    _isPhoneSelected = isSelected;
    update();
  }

  updateGoals(int index) {
    _goals[index]['isSelected'] = !_goals[index]['isSelected'];
    update();
  }

  bool get isPhoneNumberSelected => _isPhoneSelected;
  List<Map<String, dynamic>> get getSignupGoals => _goals;
}
