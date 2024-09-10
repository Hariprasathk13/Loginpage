// import 'dart:ffi';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const myapp());
}

class myapp extends StatefulWidget {
  const myapp({super.key});

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  bool check = true;
  bool eye = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
  RegExp passwordRegExp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // padding: EdgeInsets.only(top: 6),
                  decoration: BoxDecoration(
                      border: BorderDirectional(
                          bottom: BorderSide(
                              width: 10, color: Colors.blue.shade800))),
                  width: double.infinity,
                  height: 245,
                  child: Align(
                    child: Image(
                      image: AssetImage("images/4957136.jpg"),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      // height: 100,
                      width: double.infinity,
                    ),
                  ),
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 20),
                Text(
                  'By signing in you are agreeing',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                      text: 'our',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                        wordSpacing: 10,
                        fontStyle: FontStyle.italic,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Tearms and privacy policy',
                            style: TextStyle(
                                color: Colors.blue,
                                wordSpacing: 10,
                                fontStyle: FontStyle.italic,
                                fontSize: 17,
                                fontWeight: FontWeight.w500))
                      ]),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: DefaultTabController(
                      length: 2,
                      child: TabBar(
                        dividerColor: Colors.white,
                        indicatorColor: Colors.blue,
                        isScrollable: true,
                        onTap: null,
                        tabs: [
                          Tab(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.blueAccent),
                            ),
                          ),
                          Tab(
                              child: Text('Register',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blueAccent)))
                        ],
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            } else if (!emailRegExp.hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 16),
                              hintText: 'Email Address',
                              prefixIcon: Icon(Icons.email_outlined),
                              hintStyle: TextStyle(fontSize: 20)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            } else if (!passwordRegExp.hasMatch(value)) {
                              return 'Password must be at least 8 characters long and contain at least one letter and one number';
                            }
                            return null;
                          },
                          style: TextStyle(fontSize: 20),
                          obscureText: eye,
                          decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 16),
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                              // prefixIconColor: Colors.grey.shade800,
                              suffixIcon: IconButton(
                                icon: eye
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    eye = !eye;
                                  });
                                },
                              ),
                              hintStyle: TextStyle(fontSize: 20)),
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: Colors.blue.shade800,
                                  value: check,
                                  onChanged: (value) {
                                    setState(() {
                                      check = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Remember password',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              'Forget Password',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(height: 40),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              // Process data
                              // For example, print data to console
                              print('Email: ${_emailController.text}');
                              print('Password: ${_passwordController.text}');
                            }
                          },
                          child: Container(
                              width: 350,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade800,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 50,
                              alignment: Alignment.center,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          child: Text('Or connect with',
                              style: TextStyle(fontSize: 18)),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.facebook_rounded,
                                size: 50,
                                color: Colors.blue.shade900,
                              ),
                              Container(
                                child: Image(
                                    image: AssetImage(
                                        'images/icons8-apple-logo-50.png')),
                              ),
                              Container(
                                child: Image(
                                    image: AssetImage(
                                        'images/icons8-google-logo-48.png')),
                              ),
                              Container(
                                child: Image(
                                    image: AssetImage(
                                        'images/icons8-github-48.png')),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 40),
              ],
            ),
          ),
        )));
  }
}
