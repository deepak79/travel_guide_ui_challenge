import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Image.asset('assets/images/lake.jpeg'),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
