import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit_class/api_cubit_classes/app_cubit_state.dart';
import 'package:newapp/data_services/data_services_class.dart';
import 'package:newapp/model/model_class.dart';

class AppCubits extends Cubit<AppState>{
  AppCubits({required this.data}) : super(IntialState()){

    emit(StartState());
  }
  final DataServices data;
  late final places;
getData()async{
   try{
     emit(LoadingState());
     places = await data.getInfo();
     emit(LoadedState(places));
   }catch(e){

   }

   }
  detailPage(DatatModel data){
    emit(DetailsState(data));
}

getHomePage(){
  emit(LoadedState(places));
}

}