import 'dart:convert';
import 'dart:io';
import 'package:get_api/data/app_Exceptions.dart';
import 'package:get_api/data/network/BaseApiService.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiService extends BaseService {
  @override
  Future getGetApiResponse(String url) async {
      dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      // throw FetchDataExceptions("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response =
          await post(Uri.parse(url),
              body: data
          ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      // throw FetchDataExceptions("No Internet Connections");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadDataExceptions(response.body.toString());
      case 405:
      case 500:
        throw UnauthorisedExceptions(response.body.toString());
      default:
        throw FetchDataExceptions(
            'Error accured while communication with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }
}
