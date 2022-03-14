import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class SignUP extends StatefulWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  bool showSpinner =false;
  final _auth=FirebaseAuth.instance;
  String? phone;
  String? username;
  String? email;
  String? password;
  String? dropDownValue;
  List<String> Profession = [
    'Engineer',
    'Doctor',
    'Electrician',
  ];
  setFilters() {
    setState(() {
      dropDownValue = Profession[3];
    });
  }

  final username_controller = TextEditingController();
  final password_controller = TextEditingController();
  final phone_controller = TextEditingController();
  final email_controller = TextEditingController();
  SharedPreferences? registrationData;
  bool? newUser;

  @override
  void initState() {
    check_if_already_regis();
    super.initState();
  }

  void check_if_already_regis() async {
    registrationData = await SharedPreferences.getInstance();
    newUser = (registrationData!.getBool("SignUp") ?? true);
    print(newUser);
    if (newUser == false) {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username_controller.dispose();
    password_controller.dispose();
    phone_controller.dispose();
    email_controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          toolbarHeight: 70,
          title: const Text("Sign Up"),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: username_controller,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty && value.length >= 10) {
                        return 'Enter invalid number';
                      }
                      return null;
                    },
                    buildCounter: (context,
                        {required currentLength,
                        required isFocused,
                        maxLength}) {},
                    maxLength: 10,
                    onFieldSubmitted: (value) {
                      print('phone text field : $value');
                    },
                    onChanged: (value) {
                      username=value;
                    },
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Username',
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: phone_controller,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: (value) {
                      if (value!.isEmpty && value.length != 10) {
                        return 'Enter invalid number';
                      }
                      return null;
                    },
                    buildCounter: (context,
                        {required currentLength,
                        required isFocused,
                        maxLength}) {},
                    onFieldSubmitted: (value) {
                      print('Second text field : $value');
                    },
                    onChanged: (value) {
                      phone=value;
                    },
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Phone',
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: email_controller,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty && value.length != 10) {
                        return 'Enter invalid number';
                      }
                      return null;
                    },
                    buildCounter: (context,
                        {required currentLength,
                        required isFocused,
                        maxLength}) {},
                    onFieldSubmitted: (value) {
                      print('Second text field : $value');
                    },
                    onChanged: (value) {
                      email=value;
                    },
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: password_controller,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty && value.length != 10) {
                        return 'Enter invalid number';
                      }
                      return null;
                    },
                    buildCounter: (context,
                        {required currentLength,
                        required isFocused,
                        maxLength}) {},
                    onChanged: (value) {
                      password=value;
                    },
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Profession",
                        fillColor: Colors.white),
                    value: dropDownValue,
                    onChanged: (value) {
                      setState(() {
                        dropDownValue = value as String?;
                      });
                    },
                    items: Profession.map((cityTitle) => DropdownMenuItem(
                        value: cityTitle, child: Text(cityTitle))).toList(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      // color: (authController.isChecked.value)
                      //     ? Constant.secondary
                      //     : Colors.grey,
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () async {
                      setState(() {
                        showSpinner=true;
                      });
                      try{
                        final newUser = await _auth.createUserWithEmailAndPassword(email: email!, password: password!);
                        if(newUser!=null){
                          String username = username_controller.text;
                          String password = password_controller.text;
                          String email = email_controller.text;
                          String phone = phone_controller.text;
                          if (username != "" && password != "" && email != "" && phone != "") {
                            registrationData!.setBool("SignUp", false);
                            registrationData!.setString("username", username);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const MyHomePage(
                                      title: 'LoginPage',)));
                          } else {
                            EasyLoading.showInfo('Enter text Field');
                          }
                        }else{

                        }
                        setState(() {
                          showSpinner=false;
                        });
                      }catch(e){
                        print(e);
                      }
                    },
                    child: const Text(
                      'SignUP',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
