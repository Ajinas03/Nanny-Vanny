import 'package:flutter/material.dart';
import 'package:nanny_vanny/config/asset_config.dart';
import 'package:nanny_vanny/config/color_config.dart';
import 'package:nanny_vanny/screens/home_widgets/text_widget.dart';

class DrawerItems extends StatelessWidget {
  final String text;
  const DrawerItems({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          TextWidget(
            text: text,
            color: ColorConfig.darkBlue,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 0.3,
            color: ColorConfig.darkBlue,
          )
        ],
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.primaryBgColor,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 80,
                        child: Image.asset(
                          AssetConfig.profilePicture,
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      text: "Emily Cyrus",
                      fontWeight: FontWeight.bold,
                      color: ColorConfig.darkPink,
                      size: 24,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                const DrawerItems(text: "Home"),
                const DrawerItems(text: "Book A Nanny"),
                const DrawerItems(text: "How It Works"),
                const DrawerItems(text: "Why Nanny Vanny"),
                const DrawerItems(text: "My Bookings"),
                const DrawerItems(text: "My Profile"),
                const DrawerItems(text: "Support"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
