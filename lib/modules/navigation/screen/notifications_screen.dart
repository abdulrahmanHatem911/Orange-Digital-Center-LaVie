import 'package:flutter/material.dart';
import 'package:orange_pro0/modules/navigation/components/notification_items.dart';
import 'package:orange_pro0/shared/constant/spaces.dart';
import 'package:orange_pro0/shared/style/color.dart';

import '../../../models/home/noification_model.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notifications'),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return buildNotificationItems(
                context, NotificationModel.notificationData[index]);
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: PGray200,
              thickness: 1.0,
            );
          },
          itemCount: NotificationModel.notificationData.length,
        ),
      ),
    );
  }
}
