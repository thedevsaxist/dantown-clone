import 'package:d_crypto_lite/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoinsTile extends StatelessWidget {
  const CoinsTile({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return ListTile(
      minTileHeight: 76.0,
      leading: CircleAvatar(foregroundColor: AppColors.darkGrey),
      title: Text("DOGE"),
      titleTextStyle: t.bodyLarge?.copyWith(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      subtitle: Text("NGN 345.76"),
      subtitleTextStyle: GoogleFonts.poppins(
        color: AppColors.darkGrey,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      isThreeLine: true,
      contentPadding: const EdgeInsets.only(left: 0),
      trailing: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.green,
            ),
            child: Text(
              "+11.99%",
              style: t.labelLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 6),

          Text("+NGN 38.41", style: t.labelMedium?.copyWith(color: AppColors.textGreen)),
        ],
      ),
    );
  }
}
