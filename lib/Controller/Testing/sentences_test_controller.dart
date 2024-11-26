import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/function/generateRandomNumbers.dart';
import 'package:chinese_ap/Core/function/handlingdata.dart';
import 'package:chinese_ap/Core/function/sentenceAnswerBottomsheet.dart';
import 'package:chinese_ap/Core/services/services.dart';
import 'package:chinese_ap/Data/DataSource/remote/Learning/sentences_data.dart';
import 'package:chinese_ap/Data/DataSource/remote/scores_data.dart';
import 'package:chinese_ap/Data/Model/SentencesModel.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class SentencesTesController extends GetxController {
  SentencesData sentencesData =
      SentencesData(Get.find()); //Get.find() Takes from initialBinding
  ScoresData scoresData = ScoresData(Get.find());
  MyServices myServices = Get.find();
  List<SentencesModel> data = [];

  /////////////////////////////////////
  StatusRequest statusRequest = StatusRequest.None;
  int indx = 0;
  final translator = GoogleTranslator();
  FlutterTts flutterTts = FlutterTts();
  var translationtext;
  bool isChoose = false;
  String? anwser;
  int? option1;
  int? option2;
  int? option3;
  int? trueoption;
  bool isDisable = true;
  List<int> optins = [];
  int score = 0;
  List<String> splitsentece = [];
  bool isSelect = false;
/////////////////////////////////////////////
  getSentences() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await sentencesData.getSentenceData();
    statusRequest = handlingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsebody = response['data'];
        data.addAll(responsebody.map((e) => SentencesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  SplitSentencegetOptions(String sentencboy) {
    optins.clear();
    splitsentece.clear();
    sentencboy = sentencboy.trim();
    splitsentece = sentencboy.split("");

    trueoption = randomInt(0, splitsentece.length - 1);
    // anwser = splitsentece[trueoption!];
    print(anwser);
    // splitsentece[trueoption!] = '';
    option1 = randomInt(0, splitsentece.length - 1);
    option2 = randomInt(0, splitsentece.length - 1);
    option3 = randomInt(0, splitsentece.length - 1);
    optins.addAll([option1!, option2!, option3!, trueoption!]);
    optins.shuffle();
    update();
  }

  checkAnswer(String answ, int trueop, int chooseop) {
    anwser = answ;
    isSelect = true;
    if (chooseop == trueop) {
      isDisable = false;
      SentenceTrueAnswerBottomSheet();
    } else {
      isDisable = true;
      SentenceFalseAnswerBottomSheet();
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
    myServices.sharedPref.setInt("numqsentencelevel", totallevels);
    myServices.sharedPref.setInt("currentqsentencelevel", currentlevel);
    score = 0;
  }

  goTonext(ind) {
    indx = ind;
    isChoose = true;
    isDisable = true;
    isSelect = false;
    anwser = '';

    int l = myServices.sharedPref.getInt("currentqsentencelevel")!;
    int mun = myServices.sharedPref.getInt("numqsentencelevel")!;
    if (indx < l * 10) {
      myServices.sharedPref
          .setDouble("SentenceQuesionslevel$l", indx.toDouble());
      for (int i = l + 1; i <= mun; i++) {
        myServices.sharedPref.setDouble("SentenceQuesionslevel$i", 0.0);
      }
    } else if (indx == l * 10) {
      myServices.sharedPref
          .setDouble("SentenceQuesionslevel$l", indx.toDouble());
      print(score);
      addScores(score);

      isChoose = false;
      update();
    }

    update();
  }

  @override
  void onInit() {
    getSentences();
    translationFun("你会说英语吗");

    super.onInit();
  }
}
