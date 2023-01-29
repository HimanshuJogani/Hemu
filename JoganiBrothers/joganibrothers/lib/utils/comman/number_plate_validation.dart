import 'package:joganibrothers/utils/comman/comman_extension.dart';

class UserInfoValidation {

  static String? numberPlateValidation(String? string) {
    if (string == null || string.isEmpty || string.trim().isEmpty) {
      return "Please Enter Vehicle Number";
    } else if (!string.isPlate()) {
      return "Please Enter Valid Vehicle Number";
    }
    return null;
  }

}