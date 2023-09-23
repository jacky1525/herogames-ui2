import 'package:flutter/material.dart';
import '../cubit/main_cubit.dart';

class NotificationIcon extends StatelessWidget {
  final MainCubit mainCubit;
  const NotificationIcon({super.key, required this.mainCubit});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        IconButton(
          icon: const Icon(
            Icons.notifications_none_outlined,
            color: Colors.black,
            size: 32,
          ),
          onPressed: () {},
        ),
        Positioned(
            top: 12,
            right: 12,
            child: mainCubit.state.notificationCount > 0
                ? const CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 5,
                  )
                : Container()),
      ],
    );
  }
}
