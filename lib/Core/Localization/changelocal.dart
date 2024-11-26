import 'package:chinese_ap/Core/constant/AppThem.dart';
// import 'package:chinese_ap/Core/function/fcmconfig.dart';
import 'package:chinese_ap/Core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData? appThem = themArabic;

  changeLang() {
    String langcode = "ar";
    Locale locale = Locale(langcode);
    myServices.sharedPref.setString("lang", langcode);
    appThem = langcode == "ar" ? themArabic : themEnglish;
    Get.changeTheme(appThem!);
    Get.updateLocale(locale);
  }

///////////for access to location/////////////////////
  // requestPerLocation()async{
  //        bool serviceEnabled;
  //        LocationPermission permission;
  //         serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //      if (!serviceEnabled) {

  //      return Get.snackbar("Alert", 'Your Location services are disabled.');
  //    }
  //     permission = await Geolocator.checkPermission();
  //     if (permission == LocationPermission.denied) {
  //    permission = await Geolocator.requestPermission();
  //   if (permission == LocationPermission.denied) {

  //     return Get.snackbar("Alert",'Your Location permissions are denied');
  //   }
  // }
  // if (permission == LocationPermission.deniedForever) {
  //   // Permissions are denied forever, handle appropriately.
  //   return Get.snackbar("Alert",'Your Location permissions are permanently denied, we cannot request permissions.');
  // }

  // }
  // ////////////////////////////////////////////

  @override
  void onInit() {
    changeLang();
    // requestPermissionNotification();
    // fcmConfig();
    // requestPerLocation();
    String? sharedlang = myServices.sharedPref.getString("lang");
    if (sharedlang == "ar") {
      language = const Locale("ar");
      appThem = themArabic;
    } else if (sharedlang == "en") {
      language = const Locale("en");
      appThem = themEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appThem = themEnglish;
    }
    super.onInit();
  }
}
