import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herogames_ui2/constants.dart';
import 'package:herogames_ui2/widgets/notification_icon.dart';

import '../cubit/main_cubit.dart';

class FirstCard extends StatelessWidget {
  final MainCubit mainCubit;

  const FirstCard({super.key, required this.mainCubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 15,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/KittyPlays.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Wrap(
                direction: Axis.vertical,
                spacing: 5,
                children: [
                  Text(
                    Constants.title,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    Constants.subTitle,
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          NotificationIcon(mainCubit: mainCubit)
        ],
      ),
    );
  }
}
