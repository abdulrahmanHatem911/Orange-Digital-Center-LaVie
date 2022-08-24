import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_pro0/layout/cubit/cubit.dart';
import 'package:orange_pro0/layout/cubit/state.dart';
import 'package:orange_pro0/modules/navigation/components/create_post_items.dart';
import 'package:orange_pro0/modules/navigation/screen/scan_details_screen.dart';
import 'package:orange_pro0/shared/components/toast.dart';
import 'package:orange_pro0/shared/constant/const.dart';
import 'package:orange_pro0/shared/style/color.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  GlobalKey qrCode = GlobalKey();
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: QRView(
                      key: qrCode,
                      overlay: QrScannerOverlayShape(
                        borderColor: PGreen,
                        borderRadius: 10.0,
                        borderLength: 30.0,
                        borderWidth: 10,
                        cutOutSize: 300.0,
                      ),
                      onQRViewCreated: (controller) {
                        cubit.onQrCreated(controller);
                      }),
                ),
                ConditionalBuilder(
                  condition: state is LayoutQrSuccessState,
                  builder: (context) {
                    return Positioned(
                      bottom: 30.0,
                      right: 20.0,
                      left: 20.0,
                      child: GestureDetector(
                        onTap: () {
                          navigateToPage(
                              context, ScanDetailsScreen(model: cubit.result));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.09,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${cubit.result.name}',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  Text(
                                    ' ${cubit.result.description}',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              CircleAvatar(
                                radius: 23.0,
                                backgroundColor: PGreen,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  fallback: (context) => Container(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
