import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz/controller/quiz_controller.dart';
import 'package:quiz/view/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Provider.of<QuizController>(context, listen: false);
      
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 316.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash.png'))),
          ),
          InkWell(
            onTap: () {
              
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView()));
            },
            child: Container(
              height: 53.h,
              width: 158.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xff8514E1),
                  borderRadius: BorderRadius.circular(12)),
              child: Text("Start Quiz",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400,color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
