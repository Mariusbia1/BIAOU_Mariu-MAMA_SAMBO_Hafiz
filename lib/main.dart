import 'package:flutter/material.dart';
import 'pages/candidate_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candidate App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFFE0E0E0), // Grey-cendre
      ),
      home: CandidateListPage(),
    );
  }
}
