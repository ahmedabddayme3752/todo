import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              "images/avatar.png",
              scale: 7.0,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bonjour"),
                Text(
                  "Username",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
        Icon(
          Icons.menu,
        )
      ],
    );
    ;
  }
}
