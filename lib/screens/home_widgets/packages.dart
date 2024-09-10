import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nanny_vanny/config/asset_config.dart';
import 'package:nanny_vanny/config/color_config.dart';
import 'package:nanny_vanny/model/packges_model.dart';
import 'package:nanny_vanny/repository/package_repo.dart';
import 'package:nanny_vanny/screens/home_widgets/button_widget.dart';
import 'package:nanny_vanny/screens/home_widgets/text_widget.dart';

class Packages extends StatefulWidget {
  const Packages({super.key});

  @override
  State<Packages> createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  bool isLoading = true;
  late PackagesModel packages;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: "Packages",
            color: ColorConfig.darkBlue,
            fontWeight: FontWeight.bold,
            size: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              child: isLoading
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: CircularProgressIndicator(
                              color: ColorConfig.darkPink,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: packages.response?.length,
                      itemBuilder: (context, index) {
                        final items = packages.response?[index];

                        final isEven = index.isEven;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: isEven
                                    ? ColorConfig.lightPink
                                    : ColorConfig.lightBlue),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                        AssetConfig.calendar,
                                        color: !isEven
                                            ? ColorConfig.primaryBgColor
                                            : ColorConfig.darkPink,
                                      ),
                                      ButtonWidget(
                                        title: "Book Now",
                                        isCyan: !isEven ? true : false,
                                        isPink: true,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(text: items?.title ?? ""),
                                      TextWidget(text: "₹${items?.price}"),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                          child: TextWidget(
                                        text: items?.desc ?? "",
                                        color: Colors.black,
                                        size: 15,
                                      )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }))
        ],
      ),
    );
  }

  getPacckages() async {
    try {
      packages = await PackageRepo().getPackagesList();
      isLoading = false;
      setState(() {});
    } on Exception catch (e) {
      print(e);
      isLoading = true;
      setState(() {});
    }
  }

  @override
  void initState() {
    getPacckages();
    super.initState();
  }
}
