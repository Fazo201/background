import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationServer {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> onDidReceiveNotification(NotificationResponse notification) async {}

  static Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings("@mipmap/ic_launcher");

    const DarwinInitializationSettings IOSInitializationSettings = DarwinInitializationSettings();

    const InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: IOSInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotification,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveNotification,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static const NotificationDetails _platformChannelSpecifity = NotificationDetails(
      android: AndroidNotificationDetails(
        "channel_Id",
        "channel_Name",
        importance: Importance.high,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

  static Future<void> showNotification(String title,String body)async{
    await flutterLocalNotificationsPlugin.show(0, title, body, _platformChannelSpecifity);
  }

  static Future<void> scheduleNotification(String title, String body, DateTime scheduleDate, int notificationId) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      title,
      body,
      tz.TZDateTime.from(scheduleDate, tz.local),
      _platformChannelSpecifity,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
    );
  }

  static Future<void> cancelNotification(int notificationId) async {
    await flutterLocalNotificationsPlugin.cancel(notificationId);
  }
}
