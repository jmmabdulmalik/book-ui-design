import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit_class/api_cubit_classes/app_cubit_state.dart';
import 'package:newapp/cubit_class/api_cubit_classes/app_cubits.dart';
import 'package:newapp/details_screen.dart';
import 'package:newapp/start.dart';

import '../navigation/navigtion_bar.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits,AppState>(builder: (BuildContext context, state) {
        if(state is StartState ){
          return StartPage();
        } if(state is LoadedState ){
          return MainPage();
        }if(state is DetailsState ){
          return DetailScreen();
        }
        if(state is LoadingState ){
          return Center(child: CircularProgressIndicator());
        }else {
          return Container();
        }
      },),
    );
  }
}
