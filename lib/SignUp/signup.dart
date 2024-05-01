import 'package:e_commerce_app/SignUp/login.dart';
import 'package:e_commerce_app/screen/app/home.dart';
import 'package:e_commerce_app/tools/button.dart';
import 'package:e_commerce_app/tools/img.dart';
import 'package:e_commerce_app/tools/textfiled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isclick = false;

  late TextEditingController _usernameController;
  late TextEditingController _gmailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _gmailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _gmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _keyForm = GlobalKey<FormState>();

  void submite() async {
    try {
      if (!_keyForm.currentState!.validate()) {
        return;
      }
      setState(() {
        isclick = true;
      });

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _gmailController.text, password: _passwordController.text);

      FocusScope.of(context).unfocus();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (c) => const Home()));
    } on FirebaseAuthException catch (err) {
      setState(() {
        isclick = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.message ?? 'problem !!!!!!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(251, 226, 200, 0),
          Color.fromARGB(255, 175, 81, 44),
        ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
          child: Form(
            key: _keyForm,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                    padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: Text(
                      'Hello New User',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'create your account now',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        color: Colors.white60),
                  ),
                ),

                // text Filed
                // InputText(
                //   controller: _usernameController,
                //   isObscure: false,
                //   text: 'UserName',
                // ),
                // const SizedBox(
                //   height: 10,
                // ),

                InputText(
                  controller: _gmailController,
                  isObscure: false,
                  text: 'Gmail',
                ),
                const SizedBox(
                  height: 10,
                ),
                InputText(
                  controller: _passwordController,
                  isObscure: true,
                  text: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),

                const SizedBox(
                  height: 20,
                ),
                // button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Button(
                    color: const Color.fromARGB(171, 0, 0, 0),
                    enterbtn: isclick
                        ? const CircularProgressIndicator()
                        : const Text('Sign Up'),
                    texColors: Colors.white,
                    onTap: () {
                      if (mounted) {
                        submite();
                      }
                    },
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                  color: Color.fromARGB(255, 56, 56, 56),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Log in with Social media ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        decoration: TextDecoration.none),
                  ),
                ),
                // sociial media
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Img(name: 'assets/img/google.png', height: 30, width: 50),
                    Img(name: 'assets/img/apple.png', height: 60, width: 60),
                    Img(name: 'assets/img/fb.png', height: 30, width: 50),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'I don\'t have account yet ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          decoration: TextDecoration.none),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => LogIn(),
                            ),
                          );
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
