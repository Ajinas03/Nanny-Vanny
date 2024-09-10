import 'package:flutter/material.dart';
import 'package:nanny_vanny/config/asset_config.dart';
import 'package:nanny_vanny/config/color_config.dart';
import 'package:nanny_vanny/screens/home_widgets/button_widget.dart';
import 'package:nanny_vanny/screens/home_widgets/text_widget.dart';

class NannyCard extends StatelessWidget {
  const NannyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConfig.lightPink),
              height: size.height / 5,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Nanny And\nBabysitting Services",
                      size: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorConfig.darkBlue,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ButtonWidget(
                      title: "Book Now",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )),
        ),
        Positioned(right: 0, child: Image.asset(AssetConfig.nanny))
      ],
    );
  }
}
