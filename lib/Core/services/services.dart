
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService{

   late SharedPreferences sharedPref;

  Future<MyServices> init()async {
  //  await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
    sharedPref=await SharedPreferences.getInstance();
    return this;
  }


}

InitialServices()async{
 
 await Get.putAsync(() => MyServices().init());
 

  
}