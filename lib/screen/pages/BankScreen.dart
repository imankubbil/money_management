import 'package:flutter/material.dart';
import 'package:money_management/colors.dart';
import 'package:money_management/components/rounded_button.dart';
import 'package:money_management/components/text_field_border_bottom.dart';
import 'package:money_management/utils/db_helper.dart';

class BankScreen extends StatefulWidget {
  const BankScreen({Key? key}) : super(key: key);

  @override
  _BankScreenState createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  TextEditingController _bankName = TextEditingController();
  TextEditingController _saldo = TextEditingController();

  DatabaseHelper db = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> submitCategory() async {
    print("test");
    final form = _formKey.currentState;
    print(form);
    if (form!.validate()) {
      form.save();
      isLoading = true;
      setState(() {});
      // submitDataRegister();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(children: [
        Container(
          decoration: BoxDecoration(color: white, boxShadow: [
            BoxShadow(
                color: grey.withOpacity(0.05), spreadRadius: 10, blurRadius: 3),
          ]),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 25, right: 20, left: 20, bottom: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Add Bank Account",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                    color: grey.withOpacity(0.01),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(0.01),
                        spreadRadius: 10,
                        blurRadius: 3,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/images/bank.png',
                      width: size.width * 0.8),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.1),
                          spreadRadius: 10,
                          blurRadius: 3,
                        )
                      ]),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bank name",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Color(0xff67727d)),
                              ),
                              TextFormBorderBottom(
                                controller: _bankName,
                                hintData: "bank name",
                                hintText: "Enter Bank Name",
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Saldo",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Color(0xff67727d)),
                              ),
                              TextFormBorderBottom(
                                controller: _saldo,
                                hintData: "saldo",
                                hintText: "Enter Saldo",
                                textInputType: TextInputType.number,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: RoundedButton(
                                      actionPressed: submitCategory,
                                      title: 'Save'),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        )
      ]),
    );
  }
}
