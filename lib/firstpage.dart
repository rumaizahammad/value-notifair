import 'package:flutter/material.dart';
import 'package:valunotifaire/homepage.dart';
import 'package:valunotifaire/secondpage.dart';

class homepage extends StatelessWidget {
  homepage({super.key});
  ValueNotifier notifier = ValueNotifier(0);
  List screen = [FirstPage(), SecondPage()];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, value, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Value Notifier"),
              backgroundColor: Colors.cyan,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.abc_rounded), label: "FirstPage"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.abc_rounded), label: "SecondPage"),
              ],
              currentIndex: value,
              onTap: (value) {
                notifier.value = value;
              },
            ),
            body: screen[value],
          );
        });
  }
}