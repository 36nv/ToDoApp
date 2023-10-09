import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app/Screens/register_screen.dart';

void main() async {
  await Supabase.initialize(
    url: "https://fcvsmyzhkdyotlvvoryd.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZjdnNteXpoa2R5b3RsdnZvcnlkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI4MDE4NTksImV4cCI6MjAwODM3Nzg1OX0.B2U683xvxtbjPHCeYOjAvudr4MPp6u-cZ3Xbrma7XXs",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScreen(),
    );
  }
}
