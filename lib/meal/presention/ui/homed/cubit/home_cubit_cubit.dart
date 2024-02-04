import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_task/meal/data/dataSource/remote/repos/meal_repo.dart';
import 'package:meal_task/meal/domain/repos_impl/meal_repo_imp.dart';
import 'package:meal_task/meal/domain/requests/meal_request.dart';
import 'package:meal_task/meal/domain/response/meal_response.dart';
import 'package:meal_task/meal/sharred/core/network/dio_manager.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  Meal? meaResponse;
  Future<Meal?> getMealsCubit() async {
    emit(HomeCubitloadingdata());

    await DioManager.getData(path: 'trainne/diet-programs?id=78').then((value) {
      print("dddddddddddddddddddddddddd");
      print(value);

      meaResponse = Meal.fromJson(value.data);
      print(meaResponse!.data?.data![0].dietProgramMeal![0].mealName);
      emit(HomeCubitSuccessData());
      return meaResponse;
    }).catchError((onError) {
      emit(HomeCubitErrorData());
      print("error herrrrrrrrrrr");
      print(onError.toString());
      return null;
    });

    return meaResponse;
  }

  int? whichMealUserChoose;

  chnageMealFromUser(int index) {
    emit(HomeCubitChangeLoading());
    whichMealUserChoose = index;
    emit(HomeCubitChangesSucess());
  }

  void init() {}
}
