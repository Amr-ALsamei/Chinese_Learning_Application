import 'package:get/get.dart';

ValidInput(String val, int min, int max, String typ) {
  if (typ == "username") {
    // if(!GetUtils.isUsername(val)){
    //   return "not valid username";
    // }
    if (val.isEmpty) {
      return "أدخل اسم المستخدم";
    }
  }

  if (typ == "email") {
    if (!GetUtils.isEmail(val)) {
      return "إيميل غير صالح";
    }
  }

  if (typ == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "رقم جوال غير صالح";
    }
  }

  if (typ == "number") {
    if (!GetUtils.isNum(val)) {
      return "رقم غير صالح";
    }
  }

  if (val.isEmpty) {
    return "لا يمكن أن تكون فراغ";
  }
  if (val.length < min) {
    return "لا يمكن أن تكون أقل من $min";
  }

  if (val.length > max) {
    return "لا يمكن أن تكون أكبر من $max";
  }
}
