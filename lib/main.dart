import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/cubit_class/api_cubit_classes/app_cubits.dart';
import 'package:newapp/cubit_class/app_cubit_logics.dart';
import 'package:newapp/data_services/data_services_class.dart';
import 'package:newapp/start.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: true,
      builder: (context) => ScreenUtilInit(
          designSize: Size(360, 690),
          builder: (child) {
            return BlocProvider<AppCubits>(
              create: (context) => AppCubits(data: DataServices(),),
              child: AppCubitLogics(),
            );
          }),
    );
  }
}
