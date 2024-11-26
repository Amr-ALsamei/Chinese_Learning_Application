import 'package:chinese_ap/Core/Middleware/AppMiddleWare.dart';
import 'package:chinese_ap/Core/constant/routesName.dart';
import 'package:chinese_ap/View/screen/Auth/verfyCodeSignUp.dart';
import 'package:chinese_ap/View/screen/Community_screen.dart';
import 'package:chinese_ap/View/screen/Home.dart';
import 'package:chinese_ap/View/screen/Auth/SignApp.dart';
import 'package:chinese_ap/View/screen/Auth/Successed_SignUp.dart';
import 'package:chinese_ap/View/screen/Auth/forgetPassword/SuccessedResetPassword.dart';
import 'package:chinese_ap/View/screen/Auth/forgetPassword/forgetPassword.dart';
import 'package:chinese_ap/View/screen/Auth/forgetPassword/resetPassword.dart';
import 'package:chinese_ap/View/screen/Auth/forgetPassword/verfyCode.dart';
import 'package:chinese_ap/View/screen/Auth/login.dart';
import 'package:chinese_ap/View/screen/Learning/Letters/add_letters_screen.dart';
import 'package:chinese_ap/View/screen/Learning/Letters/admin_screen.dart';
import 'package:chinese_ap/View/screen/Learning/Letters/edit_letters_screen.dart';
import 'package:chinese_ap/View/screen/Learning/Letters/view_screen.dart';
import 'package:chinese_ap/View/screen/Learning/Sentences/add_sentence_screen.dart';
import 'package:chinese_ap/View/screen/Learning/Sentences/admin_screen.dart';
import 'package:chinese_ap/View/screen/Learning/Sentences/edit_sentence_screen.dart';
import 'package:chinese_ap/View/screen/Learning/Sentences/view_screen.dart';
import 'package:chinese_ap/View/screen/Learning/Vocabulary/add_vocabulary_screen.dart';
import 'package:chinese_ap/View/screen/Learning/Vocabulary/admin_screen.dart';
import 'package:chinese_ap/View/screen/Learning/Vocabulary/edit_vocabulary_screen.dart';
import 'package:chinese_ap/View/screen/Learning/Vocabulary/view_screen.dart';
import 'package:chinese_ap/View/screen/Learning/mainlearning_screen.dart';
import 'package:chinese_ap/View/screen/NotificationScreen.dart';
import 'package:chinese_ap/View/screen/Onboarding.dart';
import 'package:chinese_ap/View/screen/Profiles/edit_name_Screen.dart';
import 'package:chinese_ap/View/screen/Profiles/manage_users_Screen.dart';
import 'package:chinese_ap/View/screen/Profiles/profile_Main_screen.dart';
import 'package:chinese_ap/View/screen/Testing/letters_test_screen.dart';
import 'package:chinese_ap/View/screen/Testing/sentences_test_screen.dart';
import 'package:chinese_ap/View/screen/Testing/vocabulary_test_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'View/screen/splashScreen.dart';

List<GetPage<dynamic>>? routesPages = [
  GetPage(
      name: "/",
      page: () => const SplashViewScreen(),
      middlewares: [AppMiddleWare()]),
  GetPage(name: RoutesApp.signup, page: () => const SignApp()),
  GetPage(
      name: RoutesApp.verfyCodeSignUp,
      page: () => const VerificationCodeSignUp()),
  GetPage(name: RoutesApp.SuccessedSignUp, page: () => const SuccessedSignUp()),
  GetPage(name: RoutesApp.login, page: () => const LoginApp()),
  GetPage(name: RoutesApp.onbordingRoute, page: () => const OnBoarding()),
  GetPage(name: RoutesApp.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: RoutesApp.verfyCode, page: () => const VerificationCode()),
  GetPage(name: RoutesApp.resetpassword, page: () => const ResetPassword()),
  GetPage(
      name: RoutesApp.SuccessResetPassword,
      page: () => const SuccessedResetPassword()),
  GetPage(name: RoutesApp.home, page: () => const HomeScreen()),
  ////////////////Learning////////////////////////////
  GetPage(
      name: RoutesApp.mainlearningpage, page: () => const MainLearningScreen()),
  ////////////Vocabularies///////////////////////////////////////////
  GetPage(
      name: RoutesApp.vocabularyviewpage,
      page: () => const VocabularyViewScreen()),
  GetPage(
      name: RoutesApp.vocabularyadminviewpage,
      page: () => const VocabularyAdminScreen()),
  GetPage(
      name: RoutesApp.vocabularyaddpage,
      page: () => const AddVocabularyScreen()),
  GetPage(
      name: RoutesApp.vocabularyeditpage,
      page: () => const EditVocabularyScreen()),
  ////////////Sentences///////////////////////////////////////////
  GetPage(
      name: RoutesApp.sentenceviewpage,
      page: () => const SentencesViewScreen()),
  GetPage(
      name: RoutesApp.sentenceadminviewpage,
      page: () => const SentencesAdminScreen()),
  GetPage(
      name: RoutesApp.sentenceaddpage, page: () => const AddSentenceScreen()),
  GetPage(
      name: RoutesApp.sentenceeditpage, page: () => const EditSentenceScreen()),
  ////////////////////Letters/////////////////
  GetPage(
      name: RoutesApp.lettersviewpage, page: () => const LettersViewScreen()),
  GetPage(
      name: RoutesApp.lettersadminviewpage,
      page: () => const LettersAdminScreen()),
  GetPage(name: RoutesApp.lettersaddpage, page: () => const AddLettersScreen()),
  GetPage(
      name: RoutesApp.letterseditpage, page: () => const EditLettersScreen()),
  //////////////////////Notifications////////////
  GetPage(
      name: RoutesApp.notificationviewpage,
      page: () => const NotificationScreen()),
  //////////////////////Profiles////////////
  GetPage(
      name: RoutesApp.profileviewpage, page: () => const ProfileMainScreen()),
  GetPage(
      name: RoutesApp.manageuserspage, page: () => const ManageUsersScreen()),
  GetPage(name: RoutesApp.editnamepage, page: () => const EditNameScreen()),
  //////////////////Testing/////////////////////////////////
  GetPage(
      name: RoutesApp.vocabularytestpage,
      page: () => const VocabularyTestScreen()),
  GetPage(
      name: RoutesApp.sentencestestpage,
      page: () => const SentencesTestScreen()),
  GetPage(
      name: RoutesApp.letterstestpage, page: () => const LettersTestScreen()),
  /////////////Community///////////////////////////
  GetPage(name: RoutesApp.communitypage, page: () => const CommunityScreen()),
];
