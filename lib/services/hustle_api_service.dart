import 'package:dio/dio.dart';
import 'package:qrdemo/model/hustle_api_model.dart';

//I use a dio HTTP client to make network requests since I find it less verbose than using the http package
class HustleApiConsumption {
  Response? response;
  Dio dio = Dio();
  String baseUrl =
      "https://staging.millennialhustler.shop/product/3043/tickets";

  Future fetchTickets() async {
    //we use a future and receive results asynchronously
    //the future returna a future response object

    try {
      response = await dio.get(baseUrl);
      HustleApiModel hustleApiModel = HustleApiModel.fromJson(response!.data);
      return hustleApiModel.tickets;
      //we return the list of tickets that we can then access within the widget tree
    } on DioError catch (e) {
      if (e is DioError) {
        //This is the custom message coming from the backend
        throw e.response!.data['errors'][0] ?? "Error";
      } else {
        throw Exception("Error");
      }
    }
  }
}
