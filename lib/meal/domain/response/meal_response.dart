class Meal {
  bool? success;
  String? message;
  DataItem? data;

  Meal({this.success, this.message, this.data});

  Meal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new DataItem.fromJson(json['data']) : null;
  }
}

class DataItem {
  int? currentPage;
  List<DataView>? data;

  DataItem({
    this.currentPage,
    this.data,
  });

  DataItem.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataView>[];
      json['data'].forEach((v) {
        data!.add(new DataView.fromJson(v));
      });
    }
  }
}

class DataView {
  int? id;
  String? programName;

  List<DietProgramMeal>? dietProgramMeal;

  DataView({this.id, this.programName, this.dietProgramMeal});

  DataView.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    programName = json['program_name'];

    if (json['diet_program_meal'] != null) {
      dietProgramMeal = <DietProgramMeal>[];
      json['diet_program_meal'].forEach((v) {
        dietProgramMeal!.add(new DietProgramMeal.fromJson(v));
      });
    }
  }
}

class DietProgramMeal {
  int? id;
  String? mealName;
  List<DietProgramMealElement>? dietProgramMealElement;

  DietProgramMeal({this.id, this.mealName, this.dietProgramMealElement});

  DietProgramMeal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mealName = json['meal_name'];
    if (json['diet_program_meal_element'] != null) {
      dietProgramMealElement = <DietProgramMealElement>[];
      json['diet_program_meal_element'].forEach((v) {
        dietProgramMealElement!.add(new DietProgramMealElement.fromJson(v));
      });
    }
  }
}

class DietProgramMealElement {
  int? id;
  String? quantity;
  FoodElement? foodElement;

  DietProgramMealElement({this.id, this.quantity, this.foodElement});

  DietProgramMealElement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    foodElement = json['food_element'] != null
        ? new FoodElement.fromJson(json['food_element'])
        : null;
  }
}

class FoodElement {
  String? name;
  String? description;
  String? calories;
  String? protein;
  String? carbohydrates;
  String? fat;
  String? sugar;
  String? fiber;

  FoodElement(
      {this.name,
      this.description,
      this.calories,
      this.protein,
      this.carbohydrates,
      this.fat,
      this.sugar,
      this.fiber});

  FoodElement.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    calories = json['calories'];
    protein = json['protein'];
    carbohydrates = json['carbohydrates'];
    fat = json['fat'];
    sugar = json['sugar'];
    fiber = json['fiber'];
  }
}
