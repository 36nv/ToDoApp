import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app/Screens/to_do_screen.dart';
import 'package:to_do_app/Service/auth_Service.dart';
import 'package:to_do_app/constants/navigation.dart';
import 'package:to_do_app/constants/spacings.dart';
import 'package:to_do_app/extensions/screen_size.dart';

final supabaseService = SupabaseService(Supabase.instance.client);

class AddToDoScreen extends StatelessWidget {
  const AddToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController toDoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEEEFF5),
        iconTheme: IconThemeData(color: Colors.black),
        title: Center(
          child: Text(
            "Add To Do",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                controller: toDoController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: 20, maxWidth: 25),
                  border: InputBorder.none,
                  hintText: "What do you want to Do?",
                ),
              ),
            ),
          ),
          kVSpace128,
          InkWell(
            onTap: () {
              final todoText = toDoController.text;
              if (todoText.isNotEmpty) {
                supabaseService.insertTodoText(todoText);
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
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
