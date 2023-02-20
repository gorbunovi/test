import 'package:flutter/material.dart';
import 'package:test_work/feature/routes/app_pages.dart';
import 'servise_locator.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

