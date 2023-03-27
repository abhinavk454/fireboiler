import 'package:fireboiler/widgets/button_one_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                TextFormField(),
                TextFormField(),
              ],
            ),
            ButtonOne(
              text: "Continue",
              height: 50.0,
              width: 200.0,
              bgColor: Colors.blueGrey,
              handleClick: () {},
            ),
            const SizedBox(
              height: 10.0,
            ),
            ButtonOne(
              text: "Continue With Google",
              height: 50.0,
              width: 200.0,
              bgColor: Colors.blueGrey,
              handleClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}
