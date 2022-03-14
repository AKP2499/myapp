import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Username = TextEditingController();
  final Password = TextEditingController();
  String welcomeString = "";
  void clearText() {
    setState(() {
      print(Username.text);
      print(Password.text);
      Username.clear();
      Password.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Image.asset(
            'images/undraw_Mobile_login_re_9ntv.png',
            height: 90,
            width: 90,
          ),
          Container(
            height: 220.0,
            width: 380.0,
            color: Colors.white,
            child: Column(
              children: [
                Container(),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter Username",
                    labelText: "Username",
                    // icon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username is invalid";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    var name = value;
                    setState(() {});
                  },
                  controller: Username,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Enter Password",
                    labelText: "Password",
                    // icon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is invalid";
                    } else if (value.length < 6) {
                      return "Password length should be atleast 6 digits";
                    }
                    return null;
                  },
                  controller: Password,
                ),
                const Padding(padding: EdgeInsets.all(10.5)),
                Center(
                  child: Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 38.0),
                          child: ElevatedButton(
                            onPressed: () => debugPrint("Login"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurpleAccent),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.9,
                              ),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(left: 150.0),
                          child: ElevatedButton(
                            onPressed: () {
                              clearText();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurpleAccent),
                            child: const Text(
                              "Clear",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.9,
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome,$welcomeString",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
          const Padding(padding: EdgeInsets.all(14.0)),
        ],
      ),
    );
  }

  void showWelcome() {
    setState(() {
      if (Username.text.isNotEmpty && Password.text.isNotEmpty) {
        welcomeString = Username.text;
      } else {
        welcomeString = "Invalid Username and Password";
      }
    });
  }
}
