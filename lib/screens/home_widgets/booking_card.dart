import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nanny_vanny/config/asset_config.dart';
import 'package:nanny_vanny/config/color_config.dart';
import 'package:nanny_vanny/model/current_booking_model.dart';
import 'package:nanny_vanny/repository/package_repo.dart';
import 'package:nanny_vanny/screens/home_widgets/button_widget.dart';
import 'package:nanny_vanny/screens/home_widgets/text_widget.dart';

class BookingCard extends StatefulWidget {
  const BookingCard({super.key});

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  late CurrentBookingModel currentBookingModel;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: "Your Current Booking",
            color: ColorConfig.darkBlue,
            fontWeight: FontWeight.bold,
            size: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              // width: size.width,
              // height: size.height / 5,
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
                      itemCount: currentBookingModel.response?.length,
                      itemBuilder: (context, index) {
                        final package = currentBookingModel.response?[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      text: "One Day package",
                                      color: ColorConfig.darkPink,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    const ButtonWidget(
                                      title: "Start",
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
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: "From",
                                            color: ColorConfig.darkBlue,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  AssetConfig.date),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              TextWidget(
                                                text: package?.fromDate ?? "",
                                                color: ColorConfig.darkBlue,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  AssetConfig.time),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              TextWidget(
                                                text: package?.fromTime ?? "",
                                                color: ColorConfig.darkBlue,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: "To",
                                            color: ColorConfig.darkBlue,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  AssetConfig.date),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              TextWidget(
                                                text: package?.toDate ?? "",
                                                color: ColorConfig.darkBlue,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  AssetConfig.time),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              TextWidget(
                                                text: package?.toTime ?? "",
                                                color: ColorConfig.darkBlue,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      child: ButtonWidget(
                                        title: "Rate Us",
                                        svgPath: AssetConfig.star,
                                      ),
                                    ),
                                    Flexible(
                                      child: ButtonWidget(
                                        title: "Geolocation",
                                        svgPath: AssetConfig.loaction,
                                      ),
                                    ),
                                    Flexible(
                                      child: ButtonWidget(
                                        title: "Survilence",
                                        svgPath: AssetConfig.radio,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          ),
                        );
                      }))
        ],
      ),
    );
  }

  getBooking() async {
    try {
      currentBookingModel = await PackageRepo().getCurrentBookingList();
      isLoading = false;
      setState(() {});
    } catch (e) {
      isLoading = true;
      setState(() {});
    }
  }

  @override
  void initState() {
    getBooking();
    super.initState();
  }
}
