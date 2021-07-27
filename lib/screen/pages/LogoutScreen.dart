import 'package:flutter/material.dart';
import 'package:money_management/components/rounded_button.dart';
import 'package:money_management/screen/login/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({ Key? key }) : super(key: key);

  @override
  _LogoutScreenState createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  void logoutAction() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? status = pref.getInt('login') ?? 0;
    pref.clear();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  
          LoginScreen()
      )
    );
    // const status = pref.getInt('login') ?? 0;
    // print('status', status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.05),
      body: Center(
        child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: RoundedButton(actionPressed: logoutAction, title: 'SIGN OUT'),
                            
                          )
      ),
    );
  }
}