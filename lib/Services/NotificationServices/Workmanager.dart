import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_application_1/Services/NotificationServices/NotificationServices.dart'; // Ensure correct import
import 'package:flutter_application_1/model/taskmodel.dart'; // Import your TaskModel if needed

class WorkManagerHelper {
  void initialize() {
    Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true, // Set to false in production
    );
  }

  static void registerPeriodicTask() {
    Workmanager().registerPeriodicTask(
      '1', // Unique task ID
      'checkDueTasks',
      frequency: const Duration(minutes: 15), // Adjust as needed
      initialDelay: const Duration(minutes: 1), // Optional initial delay
      constraints: Constraints(
        networkType: NetworkType.connected, // Ensure network connection
        requiresBatteryNotLow: true,
        requiresCharging: true,
      ),
    );
  }

  static void registerOneOffTask(DateTime scheduleTime) {
    Workmanager().registerOneOffTask(
      '2', // Unique task ID
      'scheduledTask',
      initialDelay: scheduleTime.difference(DateTime.now()), // Delay until the specified time
      constraints: Constraints(
        networkType: NetworkType.connected, // Ensure network connection
        requiresBatteryNotLow: true,
        requiresCharging: true,
      ),
    );
  }

  static void callbackDispatcher() {
    // WorkManager's background task handler
    Workmanager().executeTask((task, inputData) async {
      // Initialize dependencies (Firestore, Notification, etc.)
      await NotificationHelper.initNotificationsAndService();

      // Check which task is being executed
      switch (task) {
        case 'checkDueTasks':
          await _handleCheckDueTasks();
          break;

        case 'scheduledTask':
        // Handle any specific scheduled task logic here
          break;
      }

      return Future.value(true);
    });
  }

  // Fetch tasks from Firestore and show notifications for due tasks
  static Future<void> _handleCheckDueTasks() async {
    try {
      // Fetch tasks from Firestore (adjust the path to match your Firestore structure)
      final QuerySnapshot tasksSnapshot = await FirebaseFirestore.instance.collection('tasks').get();
      final now = DateTime.now();

      for (var doc in tasksSnapshot.docs) {
        final taskData = doc.data() as Map<String, dynamic>; // Get task data
        final String taskId = doc.id;
        final String taskTitle = taskData['task'] ?? 'No Title';
        final Timestamp? dueDateTimestamp = taskData['dueDateTime'] as Timestamp?;

        if (dueDateTimestamp != null) {
          final DateTime dueDateTime = dueDateTimestamp.toDate();

          // If the due date is soon or has passed, show the notification
          if (dueDateTime.isBefore(now) || dueDateTime.isAtSameMomentAs(now)) {
            await NotificationHelper.showNotification(
              taskTitle,
              'Your task "$taskTitle" is due now or soon!',
              taskId, // Use task ID for unique notifications
            );
          } else {
            // If the due date is in the future, schedule the notification
            await NotificationHelper.scheduledNotification(
              taskTitle,
              'Your task "$taskTitle" is due soon!',
              dueDateTime,
              taskId,
            );
          }
        }
      }

      print("Due tasks processed and notifications triggered.");
    } catch (e) {
      print("Error fetching tasks for notifications: $e");
    }
  }
}
