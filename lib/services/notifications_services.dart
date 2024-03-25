import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationService {
  Future<void> listenNotifications(GlobalKey myGlobalKey) async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showFlutterNotification(message, myGlobalKey.currentContext);
    });
  }

  void _showFlutterNotification(RemoteMessage message, BuildContext? context) {
    RemoteNotification? notification = message.notification;
    // Pop dialog or anything you want
    log('Notification: ${notification?.title} ${notification?.body}');
    if (context == null) {
      return;
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(notification?.title ?? ''),
          content: Text(notification?.body ?? ''),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<String> getToken() async {
    return await FirebaseMessaging.instance.getToken() ?? '';
  }
}
