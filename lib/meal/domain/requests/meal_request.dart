import '../../sharred/constants/app_values.dart';
import '../../sharred/utls/utils.dart';

class MealssRequest {
  int? id;

  MealssRequest({this.id});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = 78;

    return data;
  }
}
