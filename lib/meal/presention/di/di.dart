// we will use GetIt

import 'package:get_it/get_it.dart';
import 'package:meal_task/meal/data/dataSource/local/preference.dart';
import 'package:meal_task/meal/data/dataSource/remote/repos/meal_repo.dart';
import 'package:meal_task/meal/domain/repos_impl/meal_repo_imp.dart';
import 'package:meal_task/meal/presention/ui/homed/cubit/home_cubit_cubit.dart';
import 'package:meal_task/meal/sharred/core/network/dio_manager.dart';

final GetIt getIt = GetIt.instance;

void setUp() async {
  //!external
  //!core
  // Preferecnes and DioManager
  getIt.registerLazySingleton(() => Preferences());
  // getIt.registerLazySingleton(() => DioManager());
  //! feature
  setupRepo();
  //!bloc
  setupBloc();
}

void setupRepo() {
  // getIt.registerSingleton<MealRepo>(MealRpeoImp(getIt.get<DioManager>()));
}

void setupBloc() {
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit());
  //getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt.get()));
}
