import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String? text;
  const CardView({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Card(
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      elevation: 5,
      child: Center(child: Text(text!, textAlign: TextAlign.center,)),
    ));
  }
}
