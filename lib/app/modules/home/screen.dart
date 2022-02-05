import 'package:flutter/material.dart';
import 'package:randomix/app/modules/rounded_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF5F5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Image.network(
                  'https://c.tenor.com/0hjOGLFaQa0AAAAC/lofi-girl-lofi.gif'),
            ),
            const Text(
              'Bem vindo!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Escolha as músicas conforme seu humor do dia.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const RoundedButton(
              color: Color(0xffDD669F),
              title: 'Continue',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xffFFF5F5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
