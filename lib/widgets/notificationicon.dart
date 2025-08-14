import 'package:ecom/widgets/iconbuttonbox.dart';
import 'package:flutter/material.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButtonBox(icon: Icons.notifications_none, onPressed: () {}),
        Positioned(
          width: 9,
          height: 9,
          top: 12,
          right: 12,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFC95A5A),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}