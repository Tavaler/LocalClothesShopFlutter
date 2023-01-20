////LOGIN
// ignore_for_file: unused_element, unused_local_variable, unused_import

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
// import 'package:ecommerce_int2/app_properties.dart';
// import 'package:ecommerce_int2/constants/api.dart';
// import 'package:ecommerce_int2/model/user.dart';
// import 'package:ecommerce_int2/screens/intro_page.dart';
// import 'package:ecommerce_int2/services/network.service.dart';
import 'package:flutter/material.dart';
import 'package:project/app_properties.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validators/validators.dart';

import '../../constants/api.dart';
import '../../intro_page.dart';
import '../../model/user.dart';

//import 'register_page.dart';

class WelcomeBackPage extends StatefulWidget {
  @override
  _WelcomeBackPageState createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User? user;
  
  var isLogin = false;

  @override
  Widget build(BuildContext context) {
    ///หัวข้อ
    Widget welcomeBack = Text(
      'Welcome Back Roberto,',
      style: TextStyle(
          color: Colors.white,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    //คำบรรยาย
    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 56.0),
        child: Text(
          'Login to your account using\nMobile number',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    ///ปุ่ม Login
    ///
      Widget loginButton() {
    return ElevatedButton.icon(
      
      //style: Size(width:12, height),
      onPressed: _buildLogin,
      icon: Icon(Icons.login_rounded),
      label: Text('Login'),
    );
  }
  
    _goProduct(String value) async {
    if (value == API.OK) {
      var prefs = await SharedPreferences.getInstance();
      prefs.setBool(API.ISLOGIN, true);

      Navigator.push(context, (MaterialPageRoute(builder: (_) => IntroPage())));
    } else {
      AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Dialog Title',
            desc: 'Dialog description here.............',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            )..show();
    }
  }

    // Widget loginButton2 = Positioned(
    //   left: MediaQuery.of(context).size.width / 4,
    //   bottom: 40,
    //   child: InkWell(
    //     onTap: _buildLogin
    //     // () {
    //     //   Navigator.of(context).push(MaterialPageRoute(
    //     //       builder: (_) => IntroPage())); //RegisterPage()));
    //     // }
    //     ,
    //     child: Container(
    //       width: MediaQuery.of(context).size.width / 2,
    //       height: 80,
    //       child: Center(
    //           child: new Text("Log In",
    //               style: const TextStyle(
    //                   color: const Color(0xfffefefe),
    //                   fontWeight: FontWeight.w600,
    //                   fontStyle: FontStyle.normal,
    //                   fontSize: 20.0))),
    //       decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //               colors: [
    //                 Color.fromRGBO(236, 60, 3, 1),
    //                 Color.fromRGBO(234, 60, 3, 1),
    //                 Color.fromRGBO(216, 78, 16, 1),
    //               ],
    //               begin: FractionalOffset.topCenter,
    //               end: FractionalOffset.bottomCenter),
    //           boxShadow: [
    //             BoxShadow(
    //               color: Color.fromRGBO(0, 0, 0, 0.16),
    //               offset: Offset(0, 5),
    //               blurRadius: 10.0,
    //             )
    //           ],
    //           borderRadius: BorderRadius.circular(9.0)),
    //     ),
    //   ),
    // );

  

    Widget _user() => TextFormField(
          initialValue: user?.userEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Exam@email.com',
            //labelText: 'Name *',
          ),
          onSaved: (String? value) {
            user?.userEmail = value!;
          },
          validator: (String? value) {
            return !isEmail(value!) ? 'Email invalid' : null;
          },
        );

    Widget _password() => TextFormField(
          obscureText: true,
          initialValue: user?.userPassword,
          decoration: const InputDecoration(
            icon: Icon(Icons.vpn_key),
            //hintText: 'What do people call you?',
            //labelText: 'Name *',
          ),
          onSaved: (String? value) {
            user?.userPassword = value!;
          },
          validator: (String? value) {
            return (value!.length < 5) ? 'aleast 5 character' : null;
          },
        );

    ///form login
    Widget loginForm = Container(
      height: 240,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: 160,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 32.0, right: 12.0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8.0),
                    //   child: TextField(
                    //     controller: email,
                    //     style: TextStyle(fontSize: 16.0),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8.0),
                    //   child: TextField(
                    //     controller: password,
                    //     style: TextStyle(fontSize: 16.0),
                    //     obscureText: true,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _user(),
                            _password(),
                            SizedBox(
                height: 10,
            ),
                           loginButton(), //style: TextStyle(fontSize: 16.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
        ],
      ),
    );

    
    Widget forgotPassword = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Forgot your password? ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color.fromRGBO(255, 255, 255, 0.5),
              fontSize: 14.0,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Reset password',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );

    ////การจัดหน้า
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background12.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
              color: transparentYellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(flex: 3),
                welcomeBack,
                Spacer(),
                subTitle,
                Spacer(flex: 2),
                loginForm,
                Spacer(flex: 2),
                forgotPassword
              ],
            ),
          )
        ],
      ),
    );
  }

  

  void _buildLogin()async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
    FocusScope.of(context).requestFocus(FocusNode());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // NetworkService()
    //     .login(user!)
    //     .then((value) => Navigator.pushNamed(context, '/product'))
    //     .onError((error, stackTrace) => print((error as DioError).message));

     Navigator.pushNamed(context, '/product');
  }

  goProduct(String value) async {
    if (value == API.OK) {
      // var prefs = await SharedPreferences.getInstance();
      // prefs.setBool(API.ISLOGIN, true);

      Navigator.pushNamed(context, '/product');
    } else {
      AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Dialog Title',
            desc: 'Dialog description here.............',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            )..show();
    }
  }
}
