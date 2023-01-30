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

  static String? drivingLicenceValidation(String? string) {
    if (string == null || string.isEmpty || string.trim().isEmpty) {
      return "Please Enter Driving Licence Number";
    } else if (!string.isLicence()) {
      return "Please Enter Valid Licence Number";
    }
    return null;
  }

}