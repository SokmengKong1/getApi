import 'package:flutter/material.dart';
import 'package:get_api/res/components/round_button.dart';
import 'package:get_api/utils/routes/routes_name.dart';
import 'package:get_api/utils/unitls.dart';
import 'package:get_api/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //use ValueNotifier for hiden password
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      // for test toasmessage

      // body: Scaffold(
      //   body: Center(
      //     child: InkWell(
      //       onTap: (){
      //         // for navigate //
      //         //Navigator.pushNamed(context, RouteName.home);
      //         //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      //         // for toasMessage can you use sameone//
      //         //Utils.snakBar("NO Internet connections", context);
      //         Utils.flushBarErrorMessage("NO Internet connections", context);
      //         // Utils.toasMessage('NO Internet connection', );
      //       },
      //       child: Text("CLICK"),),
      //   ),
      // )
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                onFieldSubmitted: (valu) {
                  Utils.fieldFocusChange(
                      BuildContext, context, emailFocusNode, passwordFocusNode);
                }),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: "*",
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock_open_rounded),
                        suffixIcon: InkWell(
                            //button call hiden
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: Icon(_obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility))),
                  );
                }),
            SizedBox(
              height: height * .085,
            ),
            RoundButton(
              title: 'Login',
              loading: authViewModel.loading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage("Please enter email", context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage("Please enter password", context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      "Please enter 6 digit password", context);
                } else {
                  // Map data = {
                  //   'email': _emailController.text.toString(),
                  //   'password': _passwordController.text.toString(),
                  // };

                  Map data = {
                    'email': 'eve.holt@reqres.in',
                    'password': 'cityslicka',
                  };
                  authViewModel.loginApi(data, context);
                  print("api hit");
                }
              },
            ),
            SizedBox(
              height: height * .085,
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RouteName.signUp);
              },
              child: Text("Don't have count ? sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
