import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/function/generateRandomNumbers.dart';
import 'package:chinese_ap/Core/function/handlingdata.dart';
import 'package:chinese_ap/Core/function/letterAnswerBottomsheet.dart';
import 'package:chinese_ap/Core/services/services.dart';
import 'package:chinese_ap/Data/DataSource/remote/Learning/letters_data.dart';
import 'package:chinese_ap/Data/DataSource/remote/scores_data.dart';
import 'package:chinese_ap/Data/Model/LettersModel.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class LettersTesController extends GetxController {
  LettersData lettersData =
      LettersData(Get.find()); //Get.find() Takes from initialBinding
  ScoresData scoresData = ScoresData(Get.find());
  MyServices myServices = Get.find();
  List<LettersModel> data = [];

  /////////////////////////////////////
  StatusRequest statusRequest = StatusRequest.None;
  int indx = 0;
  final translator = GoogleTranslator();
  FlutterTts flutterTts = FlutterTts();
  var translationtext;
  bool isChoose = false;
  String anwser = ' ';
  int? option1;
  int? option2;
  int? option3;
  bool isDisable = true;
  List<int> optins = [];
  int score = 0;
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

  getOptions(int lentgh, int ind) {
    optins.clear();
    option1 = randomInt(0, lentgh);
    option2 = randomInt(0, lentgh);
    option3 = randomInt(0, lentgh);
    optins.addAll([option1!, option2!, option3!, ind]);
    optins.shuffle();
    update();
  }

  checkAnswer(String answ, int ind, int op) {
    anwser = answ;
    if (op == ind) {
      isDisable = false;
      LetterTrueAnswerBottomSheet();
    } else {
      isDisable = true;
      LetterFalseAnswerBottomSheet();
    }
    update();
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
    myServices.sharedPref.setInt("numletterQlevel", totallevels);
    myServices.sharedPref.setInt("currentletterQlevel", currentlevel);
    score = 0;
  }

  goTonext(ind) {
    indx = ind;
    isChoose = true;
    isDisable = true;
    anwser = '';

    int l = myServices.sharedPref.getInt("currentletterQlevel")!;
    int mun = myServices.sharedPref.getInt("numletterQlevel")!;
    if (indx < l * 10) {
      myServices.sharedPref.setDouble("LetterQusionlevel$l", indx.toDouble());
      for (int i = l + 1; i <= mun; i++) {
        myServices.sharedPref.setDouble("LetterQusionlevel$i", 0.0);
      }
    } else if (indx == l * 10) {
      myServices.sharedPref.setDouble("LetterQusionlevel$l", indx.toDouble());
      print(score);
      addScores(score);

      isChoose = false;
      update();
    }

    update();
  }

  @override
  void onInit() {
    getLetters();
    translationFun("诶");

    super.onInit();
  }
}
