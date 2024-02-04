import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_task/meal/domain/response/meal_response.dart';

import 'package:meal_task/meal/presention/ui/homed/cubit/home_cubit_cubit.dart';
import 'package:meal_task/meal/presention/ui/homed/detial_screen.dart';
import 'package:meal_task/meal/sharred/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  int selectedIndex = 2;

  List<IconData> mylist = [
    Icons.shopping_bag,
    Icons.line_style_outlined,
    Icons.person,
    Icons.home_max_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getMealsCubit(),
      child: BlocConsumer<HomeCubit, HomeCubitState>(
        listener: (context, state) {
          if (state is HomeCubitSuccessData) {}
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          //cubit.getMealsCubit();

          print("hellllllllllllll");
          return Scaffold(
            backgroundColor: AppColors.homecolor,
            appBar: AppBar(
              backgroundColor: AppColors.homecolor,
              title: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_back,
                    size: 40.0,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
            body: ConditionalBuilder(
                condition: state is HomeCubitSuccessData,
                builder: (contex) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text(
                          "متوسط نسب الوجبات فى اليوم",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ),
                      //! this is the second part in screen
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.zero,
                                        bottomRight: Radius.zero,
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "30g",
                                          style:
                                              TextStyle(color: Colors.orange),
                                        ),
                                        Text("البروتينات")
                                      ]),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.zero,
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "30g",
                                          style:
                                              TextStyle(color: Colors.orange),
                                        ),
                                        Text("سعرات")
                                      ]),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.zero,
                                        bottomLeft: Radius.zero),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("30g",
                                            style: TextStyle(
                                                color: Colors.orange)),
                                        Text("كارب")
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ! this the third part in screen
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  const Text("الانظمه السابقه"),
                                  Container(
                                    height: 1,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  const Text(
                                    "النظام الحالى ",
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.orange,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        // height: 550,
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  //! the fourth 4 part in screen
                                  const Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0, bottom: 12.0),
                                    child: Text(
                                      "وجبه الافطار",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  //! the fifth 5 part in screen( وجبه الافطار)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 22.0, right: 22.0),
                                    child: ListView.separated(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          //  return _buildItemForMeals(cubit!.meaResponse)
                                          return _buildItemForMeals(
                                              (cubit
                                                  .meaResponse!
                                                  .data!
                                                  .data![0]
                                                  .dietProgramMeal![0]
                                                  .dietProgramMealElement![
                                                      index]
                                                  .foodElement!
                                                  .name)!,
                                              (cubit
                                                  .meaResponse!
                                                  .data!
                                                  .data![0]
                                                  .dietProgramMeal![0]
                                                  .dietProgramMealElement![
                                                      index]
                                                  .quantity)!,
                                              context,
                                              index,
                                              cubit.meaResponse!,
                                              (cubit
                                                  .meaResponse!
                                                  .data!
                                                  .data![0]
                                                  .dietProgramMeal![0]
                                                  .mealName)!);
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 10,
                                          );
                                        },
                                        itemCount: cubit
                                            .meaResponse!
                                            .data!
                                            .data![0]
                                            .dietProgramMeal![0]
                                            .dietProgramMealElement!
                                            .length),
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        right: 20.0, bottom: 12.0),
                                    child: Text(
                                      " وجبة الغداء",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  //! the fifth 6 part in screen( وجبه الغداء)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 22.0, right: 22.0),
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return _buildItemForMeals(
                                              (cubit
                                                  .meaResponse!
                                                  .data!
                                                  .data![0]
                                                  .dietProgramMeal![1]
                                                  .dietProgramMealElement![
                                                      index]
                                                  .foodElement!
                                                  .name)!,
                                              (cubit
                                                  .meaResponse!
                                                  .data!
                                                  .data![0]
                                                  .dietProgramMeal![1]
                                                  .dietProgramMealElement![
                                                      index]
                                                  .quantity)!,
                                              context,
                                              index,
                                              cubit.meaResponse!,
                                              (cubit
                                                  .meaResponse!
                                                  .data!
                                                  .data![0]
                                                  .dietProgramMeal![1]
                                                  .mealName)!);
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 10,
                                          );
                                        },
                                        itemCount: cubit
                                            .meaResponse!
                                            .data!
                                            .data![0]
                                            .dietProgramMeal![1]
                                            .dietProgramMealElement!
                                            .length),
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        right: 20.0, bottom: 12.0),
                                    child: Text(
                                      " وجبة العشاء",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  //! the fifth 6 part in screen( وجبه الغداء)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 22.0, right: 22.0),
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return _buildItemForMeals(
                                              (cubit
                                                  .meaResponse!
                                                  .data!
                                                  .data![0]
                                                  .dietProgramMeal![2]
                                                  .dietProgramMealElement![
                                                      index]
                                                  .foodElement!
                                                  .name)!,
                                              (cubit
                                                  .meaResponse!
                                                  .data!
                                                  .data![0]
                                                  .dietProgramMeal![2]
                                                  .dietProgramMealElement![
                                                      index]
                                                  .quantity)!,
                                              context,
                                              index,
                                              cubit.meaResponse!,
                                              (cubit
                                                  .meaResponse!
                                                  .data!
                                                  .data![0]
                                                  .dietProgramMeal![2]
                                                  .mealName)!);
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 10,
                                          );
                                        },
                                        itemCount: cubit
                                            .meaResponse!
                                            .data!
                                            .data![0]
                                            .dietProgramMeal![2]
                                            .dietProgramMealElement!
                                            .length),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                fallback: (context) {
                  return Center(child: CircularProgressIndicator());
                }),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(50),
                color: Colors.black,
                child: Container(
                  //color: Colors.amber,
                  // margin: EdgeInsets.all(25),
                  height: 50.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mylist.length,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      itemBuilder: (contex, index) {
                        return GestureDetector(
                          onTap: () {
                            selectedIndex = index;
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Icon(
                              mylist[index],
                              color: index == selectedIndex
                                  ? Colors.orange
                                  : Colors.white,
                            ),
                          ),
                        );
                      }),

                  // box
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

_buildItemForMeals(String foodElement, String quantity, context, int index,
    Meal meal, String mealNmae) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DeltailScreen(
                  myIndex: index,
                  myMeal: meal,
                  mealName: mealNmae,
                )),
      );
    },
    child: Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.orange,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey,
            ),
          ),
          const Spacer(),
          const Text(
            "x",
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            "${quantity}",
            style: TextStyle(color: Colors.grey),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "قطعه",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '  ${foodElement}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          const Icon(Icons.apple),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.delete),
          ),
        ],
      ),
    ),
  );
}
