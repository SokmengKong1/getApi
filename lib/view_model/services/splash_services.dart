import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_api/model/user_model.dart';
import 'package:get_api/view_model/user_view_model.dart';

import '../../utils/routes/routes_name.dart';
class SplashServices{
  Future<UserModel> getUserDate()=> UserViewModel().getUser();
  void checkAuthentication(BuildContext context)async{
    getUserDate().then((value) async{
      print(value.token.toString());

      if(value.token.toString() == "null" || value.token.toString() == ''){
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RouteName.login );
      }else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RouteName.home );
      }

    }).onError((error,stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
  
}