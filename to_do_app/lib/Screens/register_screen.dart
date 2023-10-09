import 'dart:math';

import 'package:flutter/material.dart';
import 'package:to_do_app/Screens/login_screen.dart';
import 'package:to_do_app/Screens/to_do_screen.dart';
import 'package:to_do_app/Widgets/text_widget.dart';
import 'package:to_do_app/constants/navigation.dart';
import 'package:to_do_app/constants/spacings.dart';
import 'package:to_do_app/extensions/screen_size.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

    return Scaffold(
      backgroundColor: Color(0xFFEEEFF5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEEEFF5),
        title: Center(
          child: Text(
            "Register Screen",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          kVSpace128,
          TextWidget(textin: "Register New Acoount", textSize: 25),
          kVSpace32,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: 20, maxWidth: 25),
                  border: InputBorder.none,
                  hintText: "  Email",
                ),
              ),
            ),
          ),
          kVSpace8,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: 20, maxWidth: 25),
                  border: InputBorder.none,
                  hintText: "  Password",
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                try {
                  await supabase.auth.signUp(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                } catch (e) {
                  print("eror$e");
                }
                ToDoScreen().pushAndRemoveUntilPage(context);
              }
            },
            child: Container(
              height: context.getHeight() / 18,
              width: context.getWidth() - 200,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                  child: Text(
                "Register",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("If you have account"),
              TextButton(
                onPressed: () {
                  LoginScreen().pushAndRemoveUntilPage(context);
                },
                child: Text("Login Now"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
