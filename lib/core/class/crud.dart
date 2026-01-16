import 'dart:convert';
import 'package:beyt/core/class/StatusRequest.dart';
//import 'package:beyt/core/functions/CheckInternet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      //if (await checkInternet()) {
      //logic to post data
      var response = await http.post(Uri.parse(linkUrl), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsory = jsonDecode(response.body);
        return Right(responsory);
      } else {
        return Left(StatusRequest.serverfailure);
      }
      // } else {
      //   return Left(StatusRequest.offlinefailure);
      // }
    } catch (_) {
      return Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> deleteData(
    String linkUrl,
    String token,
  ) async {
    try {
      //if (await checkInternet()) {
      //logic to post data
      var response = await http.delete(
        Uri.parse(linkUrl),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsory = jsonDecode(response.body);
        return Right(responsory);
      } else {
        return Left(StatusRequest.serverfailure);
      }
      // } else {
      //   return Left(StatusRequest.offlinefailure);
      // }
    } catch (_) {
      return Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> getData(
    String linkUrl,
    String token,
  ) async {
    try {
      //if (await checkInternet()) {
      var response = await http.get(
        Uri.parse(linkUrl),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsory = jsonDecode(response.body);
        return Right(responsory);
      } else {
        return Left(StatusRequest.serverfailure);
      }
      // } else {
      //   return Left(StatusRequest.offlinefailure);
      // }
    } catch (_) {
      return Left(StatusRequest.serverException);
    }
  }
}
