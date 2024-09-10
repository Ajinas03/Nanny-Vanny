import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nanny_vanny/config/asset_config.dart';
import 'package:nanny_vanny/config/color_config.dart';
import 'package:nanny_vanny/screens/home_widgets/booking_card.dart';
import 'package:nanny_vanny/screens/home_widgets/custom_appbar_widget.dart';
import 'package:nanny_vanny/screens/home_widgets/nanny_card.dart';
import 'package:nanny_vanny/screens/home_widgets/packages.dart';
import 'package:nanny_vanny/screens/home_widgets/text_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            unselectedItemColor: ColorConfig.darkBlue,
            selectedItemColor: ColorConfig.darkPink,
            selectedLabelStyle: TextStyle(
              fontFamily: "AlegreyaSans",
              fontWeight: FontWeight.bold,
              color: ColorConfig.darkPink,
              fontSize: 18,
            ),
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetConfig.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetConfig.packages),
                  label: "Packages"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetConfig.booking),
                  label: "Bookking"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetConfig.profile),
                  label: "Profile"),
            ]),
        body: Container(
          height: size.height,
          width: size.width,
          color: ColorConfig.primaryBgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomAppbarWidget(),
              Expanded(
                  child: ListView(
                children: [
                  ListTile(
                    leading: Image.asset(AssetConfig.profilePicture),
                    title: TextWidget(
                        text: "Welcome", color: ColorConfig.darkBlue),
                    subtitle: TextWidget(
                      text: "Emily Cyrus",
                      color: ColorConfig.darkPink,
                      fontWeight: FontWeight.bold,
                      size: 20,
                    ),
                  ),
                  const NannyCard(),
                  const BookingCard(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Packages()
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
