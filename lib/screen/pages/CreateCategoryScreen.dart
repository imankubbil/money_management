import 'package:flutter/material.dart';
import 'package:money_management/colors.dart';
import 'package:money_management/components/rounded_button.dart';
import 'package:money_management/utils/db_helper.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({Key? key}) : super(key: key);

  @override
  _CreateCategoryScreenState createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  int activeCategory = 0;
  TextEditingController _categoryName = TextEditingController();
  TextEditingController _percent = TextEditingController();

  DatabaseHelper db = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void submitCategory() {
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
                color: grey.withOpacity(0.05),
                spreadRadius: 10,
                blurRadius: 3),
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
                        "Add Category",
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
                height: size.height / 4,
                decoration: BoxDecoration(
                    color: grey.withOpacity(0.01),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.01),
                        spreadRadius: 10,
                        blurRadius: 3,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(0.01),
                  child: Image.asset('assets/images/category.png',
                      width: size.width * 0.8),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: size.height / 3.2,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.01),
                        spreadRadius: 10,
                        blurRadius: 3,
                      )
                    ]),
                child: Column(children: [
                  SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Category name",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xff67727d)),
                      ),
                      TextField(
                        controller: _categoryName,
                        cursorColor: black,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: black),
                        decoration: InputDecoration(
                            hintText: "Enter Category Name",
                            border: InputBorder.none),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Percent",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xff67727d)),
                      ),
                      TextField(
                        controller: _percent,
                        cursorColor: black,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: black),
                        decoration: InputDecoration(
                            hintText: "Enter Saldo",
                            border: InputBorder.none),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: RoundedButton(
                              actionPressed: submitCategory, title: 'Save'),
                        ),
                      )
                    ],
                  ),
                ),
                ],)
              ),
            ],
          ),
        )
      ]),
    );
  }
}
