import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../model/taskmodel.dart';

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initNotificationsAndService() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/launcher_icon');
    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Android Notification Channel
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      description: 'This channel is used for task notifications.',
    );

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

    // Initialize WorkManager
    Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
    // Set WorkManager to check for due tasks every 15 minutes
    Workmanager().registerPeriodicTask(
      '1',
      'checkDueTasks',
      frequency: Duration(minutes: 15),
    );

    print("WorkManager and notifications initialized.");
  }

  // WorkManager background callback
  static void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) async {
      print("WorkManager executed task: $task");
      await checkDueTasks();
      return Future.value(true);
    });
  }

  // Check for due tasks and trigger notifications
  static Future<void> checkDueTasks() async {
    try {
      // Fetch tasks and check due dates
      final tasks = await FirebaseFirestore.instance.collection('tasks').get();
      for (var doc in tasks.docs) {
        final dueDateTime = doc['dueDateTime'].toDate();
        if (dueDateTime.isBefore(DateTime.now())) {
          // Send notification
          await NotificationHelper.scheduledNotification(
            doc['task'],
            'Your task is due soon!',
            dueDateTime,
            doc.id, // Make sure to pass task ID
          );
        }
      }
    } catch (e) {
      print("Error checking due tasks: $e");
    }
  }

  // Show notification for a task
  static Future<void> showNotification(String task, String message, String taskId) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      taskId.hashCode, // Use a unique ID based on the task ID
      task,
      message,
      platformChannelSpecifics,
    );

    print("Notification shown for task: $task with ID: ${taskId.hashCode}");
  }

  // Schedule a notification for a specific due date and time
  static Future<void> scheduledNotification(
      String task,
      String message,
      DateTime dueDateTime,
      String taskId, // Include task ID
      ) async {
    final tz.TZDateTime tzDueDateTime = tz.TZDateTime.from(dueDateTime, tz.local);
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    print("Scheduling notification for task: $task at $tzDueDateTime");
    if (now.isAfter(tzDueDateTime) || now.isAtSameMomentAs(tzDueDateTime)) {
      await showNotification(task, message, taskId);
    } else {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        taskId.hashCode, // Use a unique ID based on the task ID
        task,
        message,
        tzDueDateTime,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'your_channel_id',
            'your_channel_name',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      );

      print("Notification scheduled for task: $task at $tzDueDateTime");
    }
  }

  // Cancel notification by ID
  static Future<void> cancelNotification(String taskId) async {
    await flutterLocalNotificationsPlugin.cancel(taskId.hashCode);
    print("Notification canceled for task ID: $taskId");
  }
}
