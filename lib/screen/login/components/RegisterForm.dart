import 'package:flutter/material.dart';
import 'package:money_management/components/roounded_password_input.dart';
import 'package:money_management/components/rounded_button.dart';
import 'package:money_management/components/rounded_input.dart';
import 'package:money_management/models/user.dart';
import 'package:money_management/utils/db_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
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
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  DatabaseHelper db = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void actionRegister() {
    final form = _formKey.currentState;

    print(form);
    if (form!.validate()) {
      form.save();
      isLoading = true;
      setState(() {});
      submitDataRegister();
    }
  }

  void submitDataRegister() async {
    
    var result = await db.saveUser(
      User.fromMap({
        'username': _usernameController.text,
        'name': _nameController.text,
        'password': _passwordController.text
      })
    );

    if (result != 0) { 
      Fluttertoast.showToast(
        msg: 'Register success !',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 24
      );
    }

    _usernameController.clear();
    _nameController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isLogin ? 0.0 : 1.0,
      duration: widget.animationDuration * 5,
      child: Visibility(
        visible: !widget.isLogin,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),

                    Image.asset(
                        'assets/images/image_1.png',
                        width: widget.size.width * 0.80),
                    
                    SizedBox(
                      height: 40,
                    ),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          RoundedInput(usernameController: _usernameController, iconData: Icons.email, hintData: 'Username',),
                          
                          RoundedInput(usernameController: _nameController,  iconData: Icons.face_rounded, hintData: 'Name',),

                          RoundedPasswordInput(passwordController: _passwordController, hintData: 'Password', iconData: Icons.lock),
                        ],
                      ),
                    ),

                    
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: RoundedButton(actionPressed: actionRegister, title: 'SIGN UP'),
                    )
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

