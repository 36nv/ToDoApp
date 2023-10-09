import 'package:flutter/material.dart';
import 'package:to_do_app/Screens/register_screen.dart';
import 'package:to_do_app/Screens/to_do_screen.dart';
import 'package:to_do_app/Widgets/text_widget.dart';
import 'package:to_do_app/constants/navigation.dart';
import 'package:to_do_app/constants/spacings.dart';
import 'package:to_do_app/extensions/screen_size.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEEEFF5),
        title: Center(
          child: Text(
            "Login Screen",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          kVSpace128,
          TextWidget(textin: "Login New ", textSize: 25),
          kVSpace32,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
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
            onTap: () {
              ToDoScreen().pushAndRemoveUntilPage(context);
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
                "Login",
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
              Text("If you dont have account"),
              TextButton(
                onPressed: () {
                  // RegisterScreen().pushAndRemoveUntilPage(context);
                },
                child: Text("Register Now"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
