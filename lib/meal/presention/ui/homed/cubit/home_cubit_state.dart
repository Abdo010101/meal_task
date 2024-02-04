part of 'home_cubit_cubit.dart';

@immutable
abstract class HomeCubitState {}

class HomeCubitInitial extends HomeCubitState {}

class HomeCubitloadingdata extends HomeCubitState {}

class HomeCubitSuccessData extends HomeCubitState {}

class HomeCubitErrorData extends HomeCubitState {}

class HomeCubitChangeLoading extends HomeCubitState {}

class HomeCubitChangesSucess extends HomeCubitState {}
