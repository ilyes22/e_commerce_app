import 'package:e_commerce_app/SignUp/signup.dart';
import 'package:e_commerce_app/screen/app/home.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:e_commerce_app/tools/button.dart';
import 'package:e_commerce_app/tools/img.dart';
import 'package:e_commerce_app/tools/textfiled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _SigneUpState();
}

class _SigneUpState extends State<LogIn> {
  bool isclick = false;

  late TextEditingController _GmailContoller;
  late TextEditingController _passwordCotroller;

  @override
  void initState() {
    super.initState();

    _GmailContoller = TextEditingController();
    _passwordCotroller = TextEditingController();
  }

  final _keyForm = GlobalKey<FormState>();

// signe with password and gmail.........................................................
  void submite() async {
    FocusScope.of(context).unfocus();

    if (!_keyForm.currentState!.validate()) {
      return;
    }
    setState(() {
      isclick = true;
    });

    try {
      _keyForm.currentState!.save();

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _GmailContoller.text, password: _passwordCotroller.text);

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (err) {
      setState(() {
        isclick = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.message ?? ' ther is a problem'),
        ),
      );
    }
  }

  // signe with google ................................................................

  Future signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to the Home screen
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      // Handle sign-in errors
      print('Error signing in with Google: $e');
      // You can show an error message to the user if needed
      // For example: ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign-in failed')));
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
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),

      // Form of the Log In
      child: Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                child: Image.asset(
                  'assets/img/logo.png',
                  width: 300,
                  height: 150,
                ),
              ),
              Image.asset(
                'assets/img/logo_name.png',
                width: double.infinity,
                height: 80,
              ),

              // text Filed
              InputText(
                controller: _GmailContoller,
                isObscure: false,
                text: 'Gmail',
              ),
              const SizedBox(
                height: 10,
              ),
              InputText(
                controller: _passwordCotroller,
                isObscure: true,
                text: 'Password',
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
                      : const Text('Log In'),
                  texColors: Colors.white,
                  onTap: () {
                    if (mounted) {
                      submite();
                    }
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(3),
                child: Text(
                  'Forgot Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                      decoration: TextDecoration.none),
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
                padding: EdgeInsets.only(top: 10),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // google signe in
                  GestureDetector(
                    onTap: () {
                      signInWithGoogle();
                    },
                    child: const Img(
                        name: 'assets/img/google.png', height: 30, width: 50),
                  ),

                  // apple signe in

                  const Img(
                      name: 'assets/img/apple.png', height: 50, width: 50),

                  // facebook signe in

                  const Img(name: 'assets/img/fb.png', height: 30, width: 50),
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
                            MaterialPageRoute(builder: (ctx) => SignUp()));
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
