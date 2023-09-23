import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondCard extends StatelessWidget {
  const SecondCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        item(Icons.heart_broken, "Heart Rate", "81", "BPM"),
        item(Icons.list, "To-do", "32,5", "%"),
        item(Icons.water_drop_outlined, "Calo", "1000", "Cal")
      ],
    );
  }

  Wrap item(IconData icon, String iconName, String value, String sign) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.indigo,
            ),
            Text(
              iconName,
              style: GoogleFonts.roboto(fontWeight: FontWeight.w400),
            )
          ],
        ),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              value,
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              sign,
              style:
                  GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        )
      ],
    );
  }
}
