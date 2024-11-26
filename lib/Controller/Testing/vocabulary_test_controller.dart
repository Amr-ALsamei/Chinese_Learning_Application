import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/function/generateRandomNumbers.dart';
import 'package:chinese_ap/Core/function/handlingdata.dart';
import 'package:chinese_ap/Core/function/vocabularyAnswerBottomsheet.dart';
import 'package:chinese_ap/Core/services/services.dart';
import 'package:chinese_ap/Data/DataSource/remote/Learning/vocabulary_data.dart';
import 'package:chinese_ap/Data/DataSource/remote/scores_data.dart';
import 'package:chinese_ap/Data/Model/VocabularyModel.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class VocabulariesTesController extends GetxController {
  VocabularyData vocabularyData =
      VocabularyData(Get.find()); //Get.find() Takes from initialBinding
  ScoresData scoresData = ScoresData(Get.find());
  MyServices myServices = Get.find();
  List<VocabularyModel> data = [];

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
  getVocabularies() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await vocabularyData.getVocabularyData();
    statusRequest = handlingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsebody = response['data'];
        data.addAll(responsebody.map((e) => VocabularyModel.fromJson(e)));
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
      VocabularyTrueAnswerBottomSheet();
    } else {
      isDisable = true;
      VocabularyFalseAnswerBottomSheet();
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
    myServices.sharedPref.setInt("numvocabularQlevel", totallevels);
    myServices.sharedPref.setInt("currentvocabularQlevel", currentlevel);
    score = 0;
  }

  goTonext(ind) {
    indx = ind;
    isChoose = true;
    isDisable = true;
    anwser = '';

    int l = myServices.sharedPref.getInt("currentvocabularQlevel")!;
    int mun = myServices.sharedPref.getInt("numvocabularQlevel")!;
    if (indx < l * 10) {
      myServices.sharedPref
          .setDouble("VocabularyQusionlevel$l", indx.toDouble());
      for (int i = l + 1; i <= mun; i++) {
        myServices.sharedPref.setDouble("VocabularyQusionlevel$i", 0.0);
      }
    } else if (indx == l * 10) {
      myServices.sharedPref
          .setDouble("VocabularyQusionlevel$l", indx.toDouble());
      print(score);
      addScores(score);

      isChoose = false;
      update();
    }

    update();
  }

  @override
  void onInit() {
    getVocabularies();
    translationFun("啊");

    super.onInit();
  }
}
