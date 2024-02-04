import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_task/meal/domain/response/meal_response.dart';
import 'package:meal_task/meal/presention/ui/homed/cubit/home_cubit_cubit.dart';
import 'package:meal_task/meal/sharred/constants/colors.dart';

class DeltailScreen extends StatelessWidget {
  int selectedIndex = 2;

  List<IconData> mylist = [
    Icons.shopping_bag,
    Icons.line_style_outlined,
    Icons.person,
    Icons.home_max_outlined,
  ];
  DeltailScreen(
      {super.key,
      required this.myIndex,
      required this.myMeal,
      required this.mealName});
  int myIndex;
  Meal myMeal;
  String mealName;
  int loaclIndex = 0;
  @override
  Widget build(BuildContext context) {
    print('hello');
    print(myIndex);
    if (myMeal == "افطار") {
      loaclIndex = 0;
    } else if (myMeal == "غداء") {
      loaclIndex = 1;
    } else {
      loaclIndex = 2;
    }

    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeCubitState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return Scaffold(
            backgroundColor: const Color.fromRGBO(253, 249, 246, 1),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.homecolor,
              title: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 40.0,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
            body: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              if (loaclIndex == 0)
                Center(
                  child: Text(
                      " ${myMeal.data!.data![0].dietProgramMeal![0].dietProgramMealElement![myIndex].foodElement!.name} تفاصيل "),
                )
              else if (loaclIndex == 1)
                Center(
                    child: Text(
                        " ${myMeal.data!.data![0].dietProgramMeal![1].dietProgramMealElement![myIndex].foodElement!.name} تفاصيل"))
              else
                Center(
                    child: Text(
                        " ${myMeal.data!.data![0].dietProgramMeal![2].dietProgramMealElement![myIndex].foodElement!.name} تفاصيل")),
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
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${myMeal.data!.data![0].dietProgramMeal![loaclIndex].dietProgramMealElement![myIndex].foodElement!.protein}g",
                                  style: TextStyle(color: Colors.orange),
                                ),
                                Text("البروتينات",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700))
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
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${myMeal.data!.data![0].dietProgramMeal![loaclIndex].dietProgramMealElement![myIndex].foodElement!.calories}g",
                                  style: TextStyle(color: Colors.orange),
                                ),
                                Text("سعرات",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700))
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
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "${myMeal.data!.data![0].dietProgramMeal![loaclIndex].dietProgramMealElement![myIndex].foodElement!.carbohydrates}g",
                                    style: TextStyle(color: Colors.orange)),
                                Text("كارب",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //! check what kind of meal user choose
              if (mealName == "افطار")
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return _buildDetailItem(myMeal, myIndex, 0, index);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 6,
                        );
                      },
                      itemCount: 1),
                )
              else if (mealName == "غداء")
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return _buildDetailItem(myMeal, myIndex, 1, index);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 6,
                        );
                      },
                      itemCount: 1),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        cubit.chnageMealFromUser(2);
                        print("sdffffffffff");

                        return _buildDetailItem(myMeal, myIndex, 2, i);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 6,
                        );
                      },
                      itemCount: 1),
                ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              if (mealName == "افطار")
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                      " قطعه ${myMeal.data!.data![0].dietProgramMeal![0].dietProgramMealElement![myIndex].quantity}"),
                )
              else if (mealName == "غداء")
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                      " قطعه ${myMeal.data!.data![0].dietProgramMeal![1].dietProgramMealElement![myIndex].quantity}"),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        " قطعه  ",
                        style: TextStyle(color: Colors.grey, fontSize: 20.0),
                      ),
                      Text(
                        "${myMeal.data!.data![0].dietProgramMeal![2].dietProgramMealElement![myIndex].quantity} ",
                        style: TextStyle(color: Colors.grey, fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 1.0),
                child: Text(
                  "لا يوجد ملاحظات",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ]),
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

_buildDetailItem(Meal meal, index, int whichMeal, int i) {
  return Column(
    children: [
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "58%",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "${meal.data!.data![0].dietProgramMeal![whichMeal].dietProgramMealElement![index].foodElement!.protein}g",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Text(
              "البروتين",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 12.0,
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "58%",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "${meal.data!.data![0].dietProgramMeal![whichMeal].dietProgramMealElement![index].foodElement!.calories}g",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Text(
              "سعرات",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 12.0,
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "58%",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "${meal.data!.data![0].dietProgramMeal![whichMeal].dietProgramMealElement![index].foodElement!.carbohydrates}g",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Text(
              'الكارب',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 12.0,
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "58%",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "${meal.data!.data![0].dietProgramMeal![whichMeal].dietProgramMealElement![index].foodElement!.fat}g",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Text(
              "الدهون",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 12.0,
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "58%",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "${meal.data!.data![0].dietProgramMeal![whichMeal].dietProgramMealElement![index].foodElement!.fiber}g",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Text(
              "ألياف",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 12.0,
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "58%",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "${meal.data!.data![0].dietProgramMeal![whichMeal].dietProgramMealElement![index].foodElement!.sugar}g",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Text(
              "السكريات",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    ],
  );
}
