import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:money_management/screen/pages/HomeScreen.dart';
import 'package:money_management/components/roounded_password_input.dart';
import 'package:money_management/components/rounded_button.dart';
import 'package:money_management/components/rounded_input.dart';
// import 'package:money_management/models/user.dart';
import 'package:money_management/utils/db_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  _LoginFormState createState() => _LoginFormState();
}

enum statusLogin { guest, login }

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  int signIn = 0;
  DatabaseHelper db = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void actionLogin() {
    final form = _formKey.currentState;

    print(form);
    if (form!.validate()) {
      form.save();
      isLoading = true;
      setState(() {});
      submitDataLogin();
    }
  }

  void submitDataLogin() async {

    var result = await db.checkLogin(
      _usernameController.text,
      _passwordController.text
    );

  setState(() {
      isLoading = false;
    });

    if(result != null) {
      saveDataPref(
        username: result.username,
        name: result.name,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Username atau password salah !',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 24
      );
    } 
  }

  void getDataPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('login', 0);
    setState(() {
      signIn = pref.getInt('login')!;
    });
  }

  void saveDataPref({String? username, String? name}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int login = 1;
    pref.setInt('login', login);
    pref.setString('username', username!);
    pref.setString('name', name!);
  }

  @override
  void initState() {
    super.initState();
    getDataPref();
  }

  @override
  Widget build(BuildContext context) {
    return signIn == 1
      ? HomeScreen()
      : AnimatedOpacity(
      opacity: widget.isLogin ? 1.0 : 0.0,
      duration: widget.animationDuration * 4,
      child: Visibility(
        visible: widget.isLogin,
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              width: widget.size.width,
              height: widget.defaultLoginSize,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Image.asset('assets/images/image_1.png',
                        width: widget.size.width * 0.80),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          RoundedInput(
                              usernameController: _usernameController,
                              hintData: 'Username',
                              iconData: Icons.mail),
                          RoundedPasswordInput(
                              passwordController: _passwordController,
                              hintData: 'Password',
                              iconData: Icons.lock),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: RoundedButton(actionPressed: actionLogin, title: 'SIGN IN'),
                            
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Int {
}
