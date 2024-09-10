import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_api/model/user_model.dart';
import 'package:get_api/respnsitory/auth_repository.dart';
import 'package:get_api/utils/unitls.dart';
import 'package:get_api/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;


  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }


  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context,listen:false);
      userPreference.saveUser(
        UserModel(
          token: value['token'].toString()
        )
      );
      if(kDebugMode){
        print(value.toString());
        Utils.flushBarErrorMessage("SuccessFully", context);
        Navigator.pushNamed(context,RouteName.home);
      }
    }).onError((error, stackTrace) {
      setLoading(true);
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.SingUpApi(data).then((value) {
      setSignUpLoading(false);
      if(kDebugMode){
        print(value.toString());
        Utils.flushBarErrorMessage("SignUp SuccessFully", context);
        Navigator.pushNamed(context,RouteName.home);
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
