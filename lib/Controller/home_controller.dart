import 'package:chinese_ap/View/screen/Community_screen.dart';
import 'package:chinese_ap/View/screen/Learning/mainlearning_screen.dart';
import 'package:chinese_ap/View/screen/Profiles/profile_Main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentpage = 0;
  List<Widget> listPages = [
    const MainLearningScreen(),
    const CommunityScreen(),
    ProfileMainScreen(),
  ];

  List Bottomappbar = [
    {"title": "Home", "icon": Icons.auto_stories_sharp},
    {"title": "Notification", "icon": Icons.diversity_3_sharp},
    {"title": "Profile", "icon": Icons.person_2_sharp},
  ];

  ChangePage(int i) {
    currentpage = i;
    update();
  }
}
