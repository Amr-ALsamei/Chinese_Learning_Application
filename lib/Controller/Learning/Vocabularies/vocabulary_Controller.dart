import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/Core/function/handlingdata.dart';
import 'package:chinese_ap/Core/services/services.dart';
import 'package:chinese_ap/Data/DataSource/remote/Learning/vocabulary_data.dart';
import 'package:chinese_ap/Data/DataSource/remote/scores_data.dart';
import 'package:chinese_ap/Data/Model/VocabularyModel.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class VocabulariesController extends GetxController {
  VocabularyData vocabularyData =
      VocabularyData(Get.find()); //Get.find() Takes from initialBinding
  ScoresData scoresData = ScoresData(Get.find());
  MyServices myServices = Get.find();
  List<VocabularyModel> data = [];
  ///////////////////////////////
  late TextEditingController vocabulary;
  GlobalKey<FormState> formsate = GlobalKey<FormState>();
  /////////////////////////////////////
  StatusRequest statusRequest = StatusRequest.None;
  int indx = 0;
  final translator = GoogleTranslator();
  FlutterTts flutterTts = FlutterTts();
  var translationtext;
  bool isChoose = false;

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

////////////////////////////////////////
  deleteData(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await vocabularyData.deleteVocabularyData(id);
    statusRequest = handlingData(response);
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("تنبيه", "تم الحذف بنجاح");
        data.removeWhere((element) => element.vocabularyId.toString() == id);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

////////////////////////////////////
  addData() async {
    if (formsate.currentState!.validate()) {
      Map data = {
        "vocabulary": vocabulary.text,
      };
      statusRequest = StatusRequest.loading;
      update();
      var response = await vocabularyData.addVocabularyData(data);
      statusRequest = handlingData(response);
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar("تنبيه", "تم الاضافة بنجاح");
          Get.offAllNamed(RoutesApp.vocabularyadminviewpage);
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
    myServices.sharedPref.setInt("numlevel", totallevels);
    myServices.sharedPref.setInt("currentlevel", currentlevel);
  }

  goTonext(ind) {
    indx = ind;
    isChoose = true;

    int l = myServices.sharedPref.getInt("currentlevel")!;
    int mun = myServices.sharedPref.getInt("numlevel")!;
    if (indx < l * 10) {
      myServices.sharedPref.setDouble("Vocabularylevel$l", indx.toDouble());
      for (int i = l + 1; i <= mun; i++) {
        myServices.sharedPref.setDouble("Vocabularylevel$i", 0.0);
      }
    } else if (indx == l * 10) {
      myServices.sharedPref.setDouble("Vocabularylevel$l", indx.toDouble());
      addScores(10);

      isChoose = false;
      update();
    }

    update();
  }

  @override
  void onInit() {
    getVocabularies();
    translationFun("啊");
    vocabulary = TextEditingController();
    super.onInit();
  }
}
