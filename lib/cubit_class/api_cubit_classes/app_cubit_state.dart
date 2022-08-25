 import 'package:equatable/equatable.dart';
import 'package:newapp/model/model_class.dart';

abstract class  AppState extends Equatable{}

 class IntialState extends AppState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

 }
 class StartState extends AppState{
   @override
   // TODO: implement props
   List<Object?> get props => [];

 }
 class LoadedState extends AppState{
  LoadedState(this.places);
  final List<DatatModel> places;
   @override
   // TODO: implement props
   List<Object?> get props => [places];

 }
 class LoadingState extends AppState{
   @override
   // TODO: implement props
   List<Object?> get props => [];

 }
 class DetailsState extends AppState{
  DetailsState( this.place);
  final DatatModel place;
  @override
   // TODO: implement props
   List<Object?> get props => [place];

 }
