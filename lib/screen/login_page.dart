import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapplication/screen/sign_up_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final snackBar = SnackBar(content: const Text("Wrong Email and Password"),backgroundColor: Colors.redAccent,);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _auth = FirebaseAuth.instance;
  SharedPreferences? loginData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  // controller: emailController,
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
                    emailController.text=value;
                  },
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter your email',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  // controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty && value.length != 6) {
                      return 'Enter password';
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
                    passwordController.text = value;
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
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: ()async {
                    try{
                      final user =await _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                      if(user!=null){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const HomePage()));
                      }else{
                        print("ERRor");
                      }
                    } catch(e){
                      print(e);
                      _scaffoldKey.currentState?.showSnackBar(snackBar);
                    }

                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Text("Don't have an account? ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const SignUP()));
                      },
                      child: Column(
                        children: const [
                          Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
