import 'package:get/get_utils/get_utils.dart';

class FormValidators {
  static String? required(String? v) {
    if (v == null || v.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? ensureNumeric(String? v) {
    if (v == null || v.isEmpty) {
      return 'Enter a number';
    }
    if (!v.isNumericOnly) {
      return 'Enter a valid number';
    }
    return null;
  }
}
