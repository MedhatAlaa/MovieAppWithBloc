import 'package:flutter/material.dart';
import 'package:new_movie_app/app/my_app.dart';
import 'package:new_movie_app/app/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp(MyApp());
}
