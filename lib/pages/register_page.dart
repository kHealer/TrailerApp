import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:trailers_app/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isValid = false;

  Future<void> register() async {
    if (isValid) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((user) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => LoginPage()),
            (Route<dynamic> route) => false);

        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
          content: new Text(
            "Account created Succesfully",
            style: TextStyle(color: Colors.yellow.shade600, fontSize: 18),
          ),
          backgroundColor: Colors.black,
        ));
        emailController.text = "";
        passwordController.text = "";
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: new Text(
          "Password isnt matched the credentials",
          style: TextStyle(color: Colors.red, fontSize: 18),
        ),
        backgroundColor: Colors.black,
      ));
    }
  }

  goBack() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
        (Route<dynamic> route) => false);
  }

  bool _passwordVisible = true;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(""),
        ),
        body: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      hintText: "E-mail",
                      contentPadding: const EdgeInsets.all(10),
                      hintStyle: TextStyle(
                          color: Colors.white24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                    obscuringCharacter: "•",
                    obscureText: !_passwordVisible,
                    controller: passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white24,
                      hintText: "Password",
                      contentPadding: const EdgeInsets.all(10),
                      hintStyle: TextStyle(
                          color: Colors.white24, fontWeight: FontWeight.bold),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                FlutterPwValidator(
                  controller: passwordController,
                  minLength: 6,
                  uppercaseCharCount: 1,
                  numericCharCount: 1,
                  specialCharCount: 1,
                  width: 300,
                  height: 130,
                  onSuccess: () {
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(builder: (_) => LoginPage()),
                    //     (Route<dynamic> route) => false);
                    isValid = true;
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      content: new Text(
                        "Password is matched the credentials",
                        style: TextStyle(
                            color: Colors.yellow.shade600, fontSize: 18),
                      ),
                      backgroundColor: Colors.black,
                    ));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: MaterialButton(
                        color: Colors.red.shade900,
                        textColor: Colors.white,
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            letterSpacing: 1,
                          ),
                        ),
                        onPressed: register,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: MaterialButton(
                        color: Colors.red.shade900,
                        textColor: Colors.white,
                        child: Text(
                          "Return",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            letterSpacing: 1,
                          ),
                        ),
                        onPressed: goBack,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
