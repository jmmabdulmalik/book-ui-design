
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/cubit_class/api_cubit_classes/app_cubit_state.dart';
import 'package:newapp/cubit_class/api_cubit_classes/app_cubits.dart';
import 'package:newapp/repository/color.dart';

import 'navigation/navigtion_bar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits,AppState>(builder: (BuildContext context, state) {
        DetailsState detail = state as DetailsState;
        return SizedBox(
          height: double.infinity.h,
          width:double.infinity.w,
          child:Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                height:290.h,
                width: 430.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+detail.place.img,),
                  fit: BoxFit.cover,
                ),
              ),
              )),
              Positioned(
                right: 0,
                  bottom: 0,
                  top: 50.sp,
                  left: 10.sp,
                  child:Row(
                    children: [
                      IconButton(onPressed: (){
                      }, icon: Icon(Icons.arrow_back_ios,color: Colors.yellow,)),
                    ],
                  )
              ),
              Positioned(
                left: 0,
                  right: 0,
                  bottom: 0,
                  top: 230.sp,
                  child: Container(
                    height: 400.sp,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.sp)),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left:20.0.sp,right: 20.0.sp,top: 20.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text('${detail.place.name}',style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),)),
                                Expanded(
                                    flex: 0,
                                    child: Text('\$ ${detail.place.price}',style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.blueAccent,
                                    ),)),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 0,
                              child: Row(
                                children: [
                                  Expanded(
                                      flex:0,
                                      child: Icon(Icons.location_on)),
                                  Expanded(
                                    flex: 0,
                                    child:  Text('${detail.place.location}'),
                                  ),],
                              )),

                          Expanded(
                            flex: 0,
                            child: Row(
                              children: [
                                Wrap(
                                  children: List.generate(5, (index){
                                    return Icon(Icons.star,color: index>detail.place.stars-1? Colors.grey:Colors.amber,);
                                  }),
                                ),
                                Expanded(child: Text('${detail.place.stars}.0')),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: SizedBox(
                              height: 20.sp,
                            ),
                          ),
                          Expanded(
                              flex: 0,
                              child: Text('${detail.place.people}',style: TextStyle(
                                  fontSize: 20.sp
                              ),)),
                          Expanded(
                              flex: 0,
                              child: Text('The details is helpful for the users')),

                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Wrap(
                                  children: List.generate(5, (index){
                                    return Container(
                                      margin: EdgeInsets.all(5.sp),
                                      height: 45.h,
                                      width: 45.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey.shade100,
                                      ),
                                      child: Center(child: Text('${index+1}',style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),)),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 0,
                              child: Text('Description,',style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                              ),)),
                          Expanded(
                              flex: 1,
                              child: Text("${detail.place.description}")
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  flex:0,
                                  child: Container(
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Icon(Icons.favorite_border_outlined),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child:Container(
                                    margin: EdgeInsets.only(left: 10.sp),
                                    height: 60.h,
                                    width: 200.w,
                                    decoration: BoxDecoration(
                                        color: AppColor.textColor,
                                        borderRadius: BorderRadius.circular(10.r)
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.all(10.0.sp),
                                      child: InkWell(
                                        onTap: (){
                                          BlocProvider.of<AppCubits>(context).getHomePage();
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                                flex:0,
                                                child: Text('Back To Screen')),
                                            Expanded(
                                              flex: 0,
                                              child: Wrap(
                                                children: List.generate(5, (index){
                                                  return Icon(Icons.arrow_forward_ios,size: index==0?14.sp:
                                                  index==1?16.sp:index==2?18.sp:20.sp,
                                                    color: Colors.white,
                                                  );
                                                }),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        );
      },)
    );
  }
}