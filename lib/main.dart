import 'package:flutter/material.dart';

import 'app/modules/home/presenter/pages/home_page.dart';

void main() {
  runApp(const Randomix());
}

class Randomix extends StatelessWidget {
  const Randomix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Randomix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
