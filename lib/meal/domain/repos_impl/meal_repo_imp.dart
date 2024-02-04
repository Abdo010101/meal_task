import 'dart:developer';

import 'package:meal_task/meal/data/dataSource/remote/repos/meal_repo.dart';
import 'package:meal_task/meal/domain/requests/meal_request.dart';
import 'package:meal_task/meal/domain/response/meal_response.dart';
import 'package:meal_task/meal/sharred/core/network/dio_manager.dart';

// class MealRpeoImp extends MealRepo {
//   final DioManager _dio;
//   MealRpeoImp(this._dio);
//   @override
//   Future<MeaResponse> getMeals() async {
//     late MeaResponse res;
//     try {
//       await _dio.get('trainne/diet-programs?id=78').then((response) {
//         print(response.data);
//         res = MeaResponse.fromJson(response.data);

//         // res = (response.data['results'] as List).map((e) {
//         //   return MoviesResponse.fromJson(e);
//       });
//       log(res.toString());
//       return res;
//     } catch (e) {
//       print('ssssssssssssssssssssssssssss');
//       log(e.toString());
//       return res;
//     }
//   }
// }
