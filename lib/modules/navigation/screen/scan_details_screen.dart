import 'package:flutter/material.dart';
import 'package:orange_pro0/modules/navigation/screen/blogs_screen.dart';
import 'package:orange_pro0/shared/constant/const.dart';
import 'package:orange_pro0/shared/constant/spaces.dart';
import 'package:orange_pro0/shared/style/color.dart';

import '../../../shared/components/button.dart';
import '../../../shared/network/remote/end_pointes.dart';

class ScanDetailsScreen extends StatelessWidget {
  final dynamic model;
  const ScanDetailsScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: model.imageUrl.isEmpty
                    ? AssetImage('assets/images/qr_code.png')
                    : NetworkImage('${BASE_URL}${model.imageUrl}')
                        as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                children: [
                  buildScanDetailsItem(
                    context,
                    'Sun Sight',
                    '${model.sunLight}',
                    Icons.wb_sunny_outlined,
                  ),
                  PVSpace20,
                  buildScanDetailsItem(
                    context,
                    'Water Capacity',
                    '${model.waterCapacity}',
                    Icons.water_drop,
                  ),
                  PVSpace20,
                  buildScanDetailsItem(
                    context,
                    'Temperature',
                    '${model.temperature}',
                    Icons.thermostat,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.58,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PVSpace10,
                    Text(
                      '${model.name}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    PVSpace10,
                    Expanded(
                      child: Text(
                        '${model.description}',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              height: 2.0,
                            ),
                      ),
                    ),
                    PVSpace10,
                    buildAppButton(
                      context,
                      'Go To Blogs',
                      () {
                        navigateToPage(context, PlantScreen());
                      },
                      false,
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget buildScanDetailsItem(
    BuildContext context,
    String title,
    String value,
    IconData iconButton,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.14,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Icon(
                iconButton,
                color: PGray200,
                size: 30.0,
              ),
            ),
          ),
          PHSpace20,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${value}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: PWhite,
                ),
              ),
              Text(
                '${title}',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: PGray300,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
