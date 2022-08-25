import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/cubit_class/api_cubit_classes/app_cubits.dart';
import 'package:newapp/repository/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    List Images = [
      'images/pic2.png',
      'images/pic3.png',
      'images/pic4.png',
    ];

    return Scaffold(
        body: PageView.builder(
            itemCount: 3,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) {
              return Column(

              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 20.sp, right: 20.sp,top: 60.sp),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 0,
                                  child: Text(
                                    'Trip',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Text(
                                    'Mountain',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: SizedBox(
                                    height: 15.h,
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Text(
                                    'vast possibilities for developers',
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                        'What s more, identifying the\nLet’s explore some\n',style: TextStyle(
                                      fontSize: 11.sp,
                                    ),)),
                                Expanded(
                                  flex: 1,
                                    child: Container(
                                      width: 100.w,
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(15.sp),
                                                color: AppColor.textColor,
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  BlocProvider.of<AppCubits>(context).getData();
                                                  // Navigator.push(_, MaterialPageRoute(
                                                  //     builder: (context) {
                                                  //       return MainPage();
                                                  //     }));
                                                },
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 0,
                                                          child: Icon(
                                                            Icons.arrow_forward_ios,
                                                            size: 10,
                                                            color: AppColor.icon,
                                                          )),
                                                      Expanded(
                                                          flex: 0,
                                                          child: Icon(
                                                              Icons.arrow_forward_ios,
                                                              size: 12,
                                                              color: AppColor.icon)),
                                                      Expanded(
                                                          flex: 0,
                                                          child: Icon(
                                                            Icons.arrow_forward_ios,
                                                            size: 18,
                                                            color: AppColor.icon,
                                                          )),
                                                      Expanded(
                                                          flex: 0,
                                                          child: Icon(
                                                            Icons.arrow_forward_ios,
                                                            size: 22,
                                                            color: AppColor.icon,
                                                          )),
                                                      Expanded(
                                                          flex: 0,
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_ios_outlined,
                                                            size: 25,
                                                            color: AppColor.icon,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                )),
                                ),],
                            ),
                          ),
                          Column(
                              children: List.generate(3, (indexDots) {
                                return Container(
                                  margin: EdgeInsets.only(top: 5.sp),
                                  width: 8.sp,
                                  height: index == indexDots ? 25 : 8.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.sp),
                                    color: AppColor.textColor,
                                  ),
                                );
                              }))
                        ],
                      )
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left: 10.sp,right: 20.sp),
                    height: 200.h,
                    width: 300.w,
                    child: Image.asset('${Images[index]}',fit: BoxFit.fitWidth,),
                  ),
                ),
              ],

              );
            }));
  }
}
