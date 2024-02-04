import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_task/meal/data/dataSource/local/preference.dart';
import 'package:meal_task/meal/presention/di/di.dart';
import 'package:meal_task/meal/presention/ui/homed/cubit/home_cubit_cubit.dart';
import 'package:meal_task/meal/presention/ui/homed/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_task/meal/sharred/core/network/dio_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setUp();
  //DioManager.initDio();
  DioManager();
  await Hive.initFlutter();
  await getIt<Preferences>().openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
