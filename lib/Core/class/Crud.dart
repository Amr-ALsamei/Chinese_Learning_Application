//Crud => Create && read  && Update && delete

import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:chinese_ap/Core/class/statusrequest.dart';
import 'package:chinese_ap/Core/function/checkInternet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Crud {
  // ignore: unused_field
  final String _basicAuth =
      "Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdfdsf'))}";

  final Map<String, String> _myheaders = {
    'content-type': 'application/json',
    'accept': 'application/json',
    // 'authorization': _basicAuth,
    'authorization':
        "Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdfdsf'))}"
  };

  //Either to Support the funactionality programming
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      print("Before CheckInternet");
      if (await CheckInternet()) {
        print("After CheckInternet");
        var response = await http.post(Uri.parse(linkurl), body: data);
        print(response.statusCode);
        // print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          // print("1");
          Map responsebody = jsonDecode(response.body);
          // print("2");
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }

////////////////////////////////////////////
  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    namerequest ??= "files";

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }
//////////////////////////////////////////////////////
}
