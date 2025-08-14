import 'package:evently_project/Provider/config_provider.dart';
import 'package:evently_project/core/messaging/notification.dart';
import 'package:evently_project/evently_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationService.init();
  runApp(ChangeNotifierProvider(
      create: (context) => ConfigProvider(), child: EventlyApp()));
}
