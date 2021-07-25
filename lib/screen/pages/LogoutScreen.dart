import 'package:flutter/material.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({ Key? key }) : super(key: key);

  @override
  _LogoutScreenState createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.05),
      body: Center(
        child: Text('Logout', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
    );
  }
}