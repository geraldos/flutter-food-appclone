import 'package:flutter/material.dart';
import 'package:food_app/src/widgets/food_item_card.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:food_app/src/scoped-model/main_model.dart';
import 'package:food_app/src/models/food_models.dart';


class ExplorePage extends StatefulWidget {
  final MainModel model;

  ExplorePage({this.model});
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<ExplorePage> {

  @override
  void initState() {
    super.initState();
    widget.model.fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model){
          // model.fetchFoods();
          List<Food> foods = model.foods;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: RefreshIndicator(
              onRefresh: model.fetchFoods,
              child: ListView(
                children: foods.map((Food food){
                  return FoodItemCard(
                    food.name,
                    food.description,
                    food.price.toString(),
                  );
                }).toList(),
              ),
            ),
          );
        }
      ),
    );
  }
}