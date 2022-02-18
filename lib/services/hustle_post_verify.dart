//we create a service in which we handle post requests
//we pass parameters to our post request
import 'dart:convert';

import 'package:dio/dio.dart';

class HustlePostVerify {
  Response? response;
  Dio dio = Dio();
  String baseUrl = 'https://staging.millennialhustler.shop/ticket/checkin';
  Future verifyTickets(String? code) async {
    try {
      response = await dio.post(baseUrl,
          data: json.encode({"user": 58, "code": code}));

      //we pass the user name and code string so as to make a post request to our backend
      return response;
    } on DioError catch (e) {
      //we use a try catch block to catch any errors
      if (e is DioError) {
        //This is the custom message coming from the backend
        throw e.response!.data['errors'][0] ?? "Error";
      } else {
        throw Exception("Error");
      }
    }
  }
}
