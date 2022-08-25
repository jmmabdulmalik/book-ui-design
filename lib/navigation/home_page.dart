import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/cubit_class/api_cubit_classes/app_cubit_state.dart';
import 'package:newapp/cubit_class/api_cubit_classes/app_cubits.dart';
import 'package:newapp/flutterIcon.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    
    List Images=[
      'icons/1.png',
      'icons/2.png',
      'icons/3.png',
      'icons/4.png',
    ];

    TabController tabController = TabController(length: 3, vsync: this);

    return Padding(
      padding:  EdgeInsets.only(top: 50.0.sp,),
      child: Scaffold(
        body: BlocBuilder<AppCubits,AppState>(builder: (BuildContext context, state) {
        if(state is LoadedState){
          var info =state.places;
          return   Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding:  EdgeInsets.only(left: 20.0.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu),
                        Container(
                          margin: EdgeInsets.only(right: 10.sp),
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Image.asset('icons/first.png'),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 0,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.sp,top: 20.sp),
                    child: Text('Discover',style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                  )),
              Expanded(
                flex: 0,
                child: Container(
                  margin: EdgeInsets.only(top: 20.sp),
                  child: TabBar(
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.zero
                    ),
                    labelColor: Colors.black,
                    controller: tabController,
                    tabs: [
                      Tab(text: 'Places',),
                      Tab(text: 'Inspitration',),
                      Tab(text: 'Emotion',),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Container(
                      height: 300.h,
                      child: ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                           BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20.sp),
                              height: 300.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Image.network("http://mark.bslmeiyu.com/uploads/${info[index].img}"
                            ),),
                          );
                        }, ),
                    ),
                    Container(
                      height: 300.h,
                      child: ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20.sp),
                              height: 300.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Image.network("http://mark.bslmeiyu.com/uploads/${info[index].img}"
                              ),),
                          );
                        }, ),
                    ),
                    Container(
                      height: 300.h,
                      child: ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20.sp),
                              height: 300.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Image.network("http://mark.bslmeiyu.com/uploads/${info[index].img}"
                              ),),
                          );
                        }, ),
                    ),
                  ],

                ),
              ),
              Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(left: 20.0.sp,right: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Explore More',style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text('See all'),
                      ],
                    ),
                  )),
              Expanded(
                flex: 0,
                child: SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 25.sp),
                            height:70.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                                color:index==0?Colors.grey.shade200:index==1?Colors.yellow.shade100:index==2?Colors.grey.shade200:Colors.green.shade100,
                                borderRadius: BorderRadius.circular(10.sp)
                            ),
                            child: Image.asset('${Images[index]}'),
                          )
                        ],
                      );
                    },),
                ),
              ),
            ],
          );
        }   else{return Center(child: Text('Some Error'));}
        },)
      ),
    );
  }
}
