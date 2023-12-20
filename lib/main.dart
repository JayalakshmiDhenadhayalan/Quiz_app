import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz/controller/quiz_controller.dart';
import 'package:quiz/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
     builder: (_ , child) {
          return
          MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context)=>QuizController())
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Artifitia Quiz Text',
              theme: ThemeData(scaffoldBackgroundColor: Color(0xff481450)),
              home: SplashView(),
            ),
          );
        });
  }
}
