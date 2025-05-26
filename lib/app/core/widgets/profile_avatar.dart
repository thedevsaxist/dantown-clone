import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/headshot.jpeg"),
          alignment: Alignment(0, -1),
          fit: BoxFit.fitWidth,
        ),
      ),
      // child: Image.asset("assets/headshot.jpeg", fit: BoxFit.scaleDown),
    );
  }
}
