import 'dart:convert';

import 'package:get_api/data/network/BaseApiService.dart';
import 'package:get_api/data/network/NetworkApiService.dart';
import 'package:get_api/res/components/app_url.dart';
import 'package:http/http.dart';

class AuthRepository {
  BaseService _apiService = NetworkApiService();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.getPostApiResponse(AppUrl.loginEndPint, data);
      return response;
      // Response response =
      // await post(Uri.parse("dsfoksla"),
      //     body: {
      //   'er' 'er'
      //     }
      // ).timeout(Duration(seconds: 10));
      // var data = jsonDecode(response.body);
      //   if(response.statusCode == 200){
      //     return response;
      //   }else if(response.statusCode == 400){
      //     return data;
      //   }
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> SingUpApi(dynamic data) async {
    try {
      dynamic response = await _apiService.getPostApiResponse(
          AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
