
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> AlertExitApp(){

  Get.defaultDialog(
    title: "Alert",
    middleText: "Are you want to Exit from Application?",
    actions: [
      ElevatedButton(
        onPressed: (){
          exit(0);
        },
         child: const Text("OK")),
      ElevatedButton(
        onPressed: (){
          Get.back();
        },
         child: const Text("Cancel"))
    ]
  );

  return Future.value(true);
}