import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_trax/services/theme_service.dart';
import 'package:todo_trax/ui/theme.dart';
import 'package:todo_trax/ui/views/ongoing_view.dart';
import 'package:todo_trax/ui/views/splash_view.dart';

import 'models/task.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Hive.initFlutter();
  await Hive.openBox("notes_box");
  Hive.registerAdapter(TaskAdapter());
  runApp(const ToDoTrax());
}

class ToDoTrax extends StatelessWidget {
  const ToDoTrax({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      home:  const SplashScreen(),
    );
  }
}
