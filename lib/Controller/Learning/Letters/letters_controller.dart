import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/Core/function/handlingdata.dart';
import 'package:chinese_ap/Core/services/services.dart';
import 'package:chinese_ap/Data/DataSource/remote/Learning/letters_data.dart';
import 'package:chinese_ap/Data/DataSource/remote/scores_data.dart';
import 'package:chinese_ap/Data/Model/LettersModel.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class LettersController extends GetxController {
  LettersData lettersData =
      LettersData(Get.find()); //Get.find() Takes from initialBinding
  ScoresData scoresData = ScoresData(Get.find());
  MyServices myServices = Get.find();
  List<LettersModel> data = [];
  ///////////////////////////////
  late TextEditingController letter;
  late TextEditingController lettermean;
  GlobalKey<FormState> formsate = GlobalKey<FormState>();
  /////////////////////////////////////
  StatusRequest statusRequest = StatusRequest.None;
  int indx = 0;
  final translator = GoogleTranslator();
  FlutterTts flutterTts = FlutterTts();
  var translationtext;
  bool isChoose = false;

/////////////////////////////////////////////
  getLetters() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await lettersData.getLettersData();
    statusRequest = handlingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsebody = response['data'];
        data.addAll(responsebody.map((e) => LettersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

////////////////////////////////////////
  deleteData(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await lettersData.deleteLetterData(id);
    statusRequest = handlingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("تنبيه", "تم الحذف بنجاح");
        data.removeWhere((element) => element.letterId.toString() == id);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

////////////////////////////////////
  addData() async {
    if (formsate.currentState!.validate()) {
      Map data = {"letter": letter.text, "mean": lettermean.text};
      statusRequest = StatusRequest.loading;
      update();
      var response = await lettersData.addLetterData(data);
      statusRequest = handlingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar("تنبيه", "تم الاضافة بنجاح");
          Get.offAllNamed(RoutesApp.lettersadminviewpage);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

//////////////////////////////////////
  addScores(int score) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await scoresData.addData(
        myServices.sharedPref.getString("Id")!, score.toString());
    statusRequest = handlingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //  Get.snackbar("تنبيه", "تم الاضافة بنجاح");
        // Get.offAllNamed(RoutesApp.letterspage);
        print("Ok");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
/////////////////////////////////////////////////

  translationFun(txt) async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      translationtext =
          await translator.translate(txt, from: 'zh-cn', to: 'ar');
      statusRequest = StatusRequest.success;
      update();
    } catch (e) {
      print(e);
    }
  }

  speakFunction(String txt) async {
    await flutterTts.setLanguage("zh-cn");

    await flutterTts.setSpeechRate(0.5);

    await flutterTts.setVolume(1.0);

    await flutterTts.setPitch(1.0);
    await flutterTts.speak(txt);
  }

  ShowLevelsOn() {
    isChoose = false;
    update();
  }

  getNumberLevels(currentlevel, totallevels) {
    myServices.sharedPref.setInt("numletterslevel", totallevels);
    myServices.sharedPref.setInt("currentletterlevel", currentlevel);
  }

  goTonext(ind) {
    indx = ind;
    isChoose = true;

    int l = myServices.sharedPref.getInt("currentletterlevel")!;
    int mun = myServices.sharedPref.getInt("numletterslevel")!;
    if (indx < l * 10) {
      myServices.sharedPref.setDouble("Letterlevel$l", indx.toDouble());
      for (int i = l + 1; i <= mun; i++) {
        myServices.sharedPref.setDouble("Letterlevel$i", 0.0);
      }
    } else if (indx == l * 10) {
      myServices.sharedPref.setDouble("Letterlevel$l", indx.toDouble());
      addScores(10);

      isChoose = false;
      update();
    }

    update();
  }

  @override
  void onInit() {
    getLetters();
    translationFun("诶");
    letter = TextEditingController();
    lettermean = TextEditingController();
    super.onInit();
  }
}
