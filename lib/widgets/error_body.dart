import 'package:flutter/material.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red.shade400,
            Colors.red.shade100,
            Colors.white,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset("assets/images/error.png"),
            ),
            SizedBox(
              height: 75,
              width: double.infinity,
            ),
            // Text(
            //   "$message😞",
            //   style: TextStyle(fontSize: 25),
            // ),
            Text(
              "Oops an error occurred😞",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Try again..🤗",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
