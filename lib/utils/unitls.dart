import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext,context
      ,FocusNode current
      , FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  static toasMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 20);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        padding: EdgeInsets.all(10),
        message: message,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        borderRadius: BorderRadius.circular(30),
        reverseAnimationCurve:Curves.easeInOut,
        positionOffset: 10,
        flushbarPosition: FlushbarPosition.TOP,
        icon: Icon(Icons.error,size:40, color: Colors.white,),
      )..show(context),
    );
  }
  static snakBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      )
    );
  }
}
