import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../screen/main_screen.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var email = "";
  var password = "";

  final storage = new FlutterSecureStorage();

  login() async {
    // String username = emailController.text;
    // String password = passwordController.text;

    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
    // print(userCredential.user?.uid);
    await storage.write(key: "uid", value: userCredential.user?.uid);
    // .then((user) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
        (Route<dynamic> route) => false);
    // });
  }

  register() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => RegisterPage()),
        (Route<dynamic> route) => false);
  }

  bool _passwordVisible = true;
  // late SharedPreferences logindata;
  // late bool newuser;

  @override
  void initState() {
    _passwordVisible = false;
    // super.initState();
    // check_if_already_login();
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
                  obscureText: !_passwordVisible,
                  obscuringCharacter: "•",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    color: Colors.red.shade900,
                    textColor: Colors.white,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        letterSpacing: 1,
                      ),
                    ),
                    onPressed: login,
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Don't have an Account ?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.black,
                    textColor: Colors.red,
                    child: Text(
                      "Register here",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                    onPressed: register,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void check_if_already_login() async {
  //   logindata = await SharedPreferences.getInstance();
  //   newuser = (logindata.getBool("login") ?? true);

  //   if (newuser == false) {
  //     Navigator.pushReplacement(
  //         context, new MaterialPageRoute(builder: (context) => MainScreen()));
  //   }
  // }

  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }
}
