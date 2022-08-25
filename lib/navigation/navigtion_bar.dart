import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/main.dart';
import 'package:newapp/navigation/home_page.dart';
import 'package:newapp/navigation/my_page.dart';
import 'package:newapp/navigation/search_page.dart';
import '../cubit_class/bottom_navigtio_cubit.dart';
import '../details_screen.dart';
import 'bar_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int current = 3;
  PageController contoller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
        create: (BuildContext context) => NavigationCubit(),
        child: Scaffold(
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: contoller,
            children: [
              HomePage(),
              BarItem(),
              SearchPage(),
              MyPage(),
            ],
          ),
          bottomNavigationBar:
              (BlocBuilder<NavigationCubit, int>(builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(bottom: 10.sp,left: 8.sp,right: 8.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<NavigationCubit>().setPageIndex(pageIndex: 0);
                      contoller.jumpToPage(0);
                    },
                    child: Icon(Icons.apps,color: Colors.black,),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<NavigationCubit>().setPageIndex(pageIndex: 1);
                      contoller.jumpToPage(1);
                    },
                    child: Icon(Icons.bar_chart_sharp,color: Colors.black,),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<NavigationCubit>().setPageIndex(pageIndex: 2);
                      contoller.jumpToPage(2);
                    },
                    child: Icon(Icons.search,color: Colors.black,),
                  ),
                  InkWell(
                    onTap: () {
                      context.read<NavigationCubit>().setPageIndex(pageIndex: 3);
                      contoller.jumpToPage(3);
                    },
                    child: Icon(Icons.person,color: Colors.black,),
                  ),
                ],
              ),
            );
          })),
        ));
  }
}
