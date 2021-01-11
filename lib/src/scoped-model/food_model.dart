import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/food_models.dart';
import 'package:http/http.dart' as http;

class FoodModel extends Model {
  List<Food> _foods = [];

  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  List<Food> get foods {
    return List.from(_foods);
  }

  Future<bool> addFood(Food food) async{
    // _foods.add(food);
    _isLoading = true;
    notifyListeners();
    try{
      final Map<String, dynamic> foodData = {
        "title" : food.name,
        "category" : food.category,
        "description" : food.description,
        "price" : food.price,
        "discount" : food.discount,
      };
      final http.Response response =  await http.post(DotEnv().env['API_URL'], body: json.encode(foodData));

      final Map<String, dynamic> responseData = json.decode(response.body);

      Food foodWithID = Food(
        id: responseData["name"],
        name: food.name,
        description: food.description,
        category: food.category,
        discount: food.discount,
        price: food.price,
      );

      _isLoading = false;
      notifyListeners();
      fetchFoods();
      return Future.value(true);
    }catch(e){
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
      // print("Connection error: $e");
    }
  }

  Future<bool> fetchFoods() async{
    _isLoading = true;
    notifyListeners();

    try{
      final http.Response response =
      await http.get(DotEnv().env['API_URL']);
      // print("Fetching data: ${response.body}");

      final Map<String, dynamic> fetchData = json.decode(response.body);
      print(fetchData);

      final List<Food> foodItems = [];

      fetchData.forEach((String id, dynamic foodData){
        Food foodItem = Food(
          id: id,
          name: foodData["title"],
          description: foodData["description"],
          category: foodData["category"],
          price: foodData["price"],
          discount: foodData["discount"],
        );

        foodItems.add(foodItem);
      });

      _foods = foodItems;
      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch(error) {
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }
}