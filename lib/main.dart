import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_trax/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo_trax/services/theme_service.dart';
import 'package:todo_trax/simple_bloc_observer.dart';
import 'package:todo_trax/ui/theme.dart';
import 'package:todo_trax/ui/views/ongoing_view.dart';
import 'package:todo_trax/ui/views/splash_view.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'models/task.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>("notes_box");
  tz.initializeTimeZones();
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
