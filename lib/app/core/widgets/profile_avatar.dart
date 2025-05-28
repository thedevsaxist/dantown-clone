import 'package:d_crypto_lite/app/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

/// Displays a circular user profile avatar.
///
/// Uses a default image asset and is typically shown in profile or account screens.
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
          image: Assets.images.headshot.provider(),
          alignment: Alignment(0, -1),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
