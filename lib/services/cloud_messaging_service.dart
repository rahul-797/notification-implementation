import 'package:api/models/push_notification_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class CloudMessagingService{
  late final FirebaseMessaging _messaging;



  void registerNotification() async {
    _messaging = FirebaseMessaging.instance;
    await Firebase.initializeApp();

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        PushNotificationModel notification = PushNotificationModel(
          title: message.notification?.title,
          body: message.notification?.body,
        );
        showSimpleNotification(
          Text(notification.title!),
          subtitle: Text(notification.body!),
          background: Colors.cyan.shade700,
          duration: Duration(seconds: 2),
        );
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }
}