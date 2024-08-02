
import 'package:flutter/material.dart';

class CustomProGressIndicator extends StatelessWidget {
  const CustomProGressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.lightBlueAccent,
      ),
    );
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: CustomProGressIndicator(),
      );
    },
  );
}
