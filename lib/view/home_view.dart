import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz/controller/quiz_controller.dart';
import 'package:quiz/model/quiz_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<QuizController>(context, listen: false).getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<QuizController>(builder: (context, value, child) {
        if (value.qusData.isEmpty) {
          return CircularProgressIndicator();
        }
        final QuizModel quiz = value.qusData[0];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                quiz.question,
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
              SizedBox(
                height: 10,
              ),
              // for(MapEntry numbers in numbers.entries)
              SizedBox(
                height: 400.h,
                child: ListView.separated(
                  itemCount: quiz.options.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    //  value.selectindex(index);
                    return InkWell(
                      onTap: () {
                        if (value.selectedIndex==-1) {
                           value.selectindex(index);
                        }
                       
                      },
                      child: Container(
                        height: 50.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:value.selectedIndex!=-1? index==value.selectedIndex&& quiz.options[value.selectedIndex].isCorrect ==
                                  true
                              ? Colors.green
                              :index==value.selectedIndex&& quiz.options[value.selectedIndex].isCorrect ==
                                      false
                                  ? Colors.red
                                  : Colors.transparent: Colors.transparent,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Text(
                          ' ${quiz.options[index].text.toString()}',
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                    value.nextIndex();
                  },
                  child: Text("Next")),
              // Container(
              //               height: 50.h,
              //               alignment: Alignment.center,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(18),
              //                   border: Border.all(color: Colors.white)),
              //               child:

              //               Text(
              //                 quiz.options[0].text.toString()

              //                ' ${quiz.options[index].text.toString()}',
              //                 style: TextStyle(fontSize: 18.sp, color: Colors.white),
              //               ),

              //             ),     // ),
            ],
          ),
        );
      }),
    );
  }
}
