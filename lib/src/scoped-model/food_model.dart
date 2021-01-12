import 'dart:convert';
import 'package:flutter/material.dart';
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

  int get foodLength{
    return _foods.length;
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
          price: double.parse(foodData["price"].toString()),
          discount: double.parse(foodData["discount"].toString()),
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

  Future<bool> updateFood(Map<String, dynamic> foodData, String foodId) async {
    _isLoading = true;
    notifyListeners();

   //get food by id
    Food theFood = getFoodItemById(foodId);

    //get index of the food
    int foodIndex = _foods.indexOf(theFood);
    try{
      await http.put(DotEnv().env['API_URL_EDIT'], body: json.encode(foodData));

      Food updateFoodItem = Food(
        id: foodId,
        name: foodData['title'],
        description: foodData['description'],
        category: foodData['category'],
        price: double.parse(foodData['price']),
        discount: double.parse(foodData['discount'])
      );

      _foods[foodIndex] = updateFoodItem;

      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    }catch(error){
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  Food getFoodItemById(String foodId){
   Food food;
   for(int i = 0; i < _foods.length; i++){
     if(_foods[i].id == foodId){
       food = _foods[i];
       break;
     }
   }
   return food;
  }
}