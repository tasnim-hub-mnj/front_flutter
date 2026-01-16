import 'package:beyt/core/services/services.dart';
import 'package:beyt/data/model/Home/notificationModel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('تم منح الإذن من قبل المستخدم');
  }
}

MyServices myServices = Get.find();

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer().playNotification();
    myServices.sharedPreferences.setString(
      "verifyCode",
      message.notification!.body!,
    );
    List<NotificationModel> notificationList = [];
    notificationList.add(
      NotificationModel(
        title: message.notification!.title,
        body: message.notification!.body,
      ),
    );
    Get.snackbar(
      message.notification!.title!,
      message.notification!.body!,
      duration: Duration(seconds: 0),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  });
}
