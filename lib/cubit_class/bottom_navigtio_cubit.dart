import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<int>{
  NavigationCubit() : super(0);
  setPageIndex({required pageIndex}){
    emit(pageIndex);
  }
}
