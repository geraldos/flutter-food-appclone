import 'package:flutter/material.dart';
import 'package:food_app/src/admin/pages/add_food_item.dart';
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
        builder: (BuildContext sctx, Widget child, MainModel model){
          // model.fetchFoods();
          List<Food> foods = model.foods;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: RefreshIndicator(
              onRefresh: model.fetchFoods,
              child: ListView.builder(
                itemCount: model.foodLength,
                itemBuilder: (BuildContext lctx, int index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) => AddFoodItem(
                            food: model.foods[index],
                          )
                        )
                      );
                    },
                    child: FoodItemCard(
                      model.foods[index].name,
                      model.foods[index].description,
                      model.foods[index].price.toString(),
                    ),
                  );
                },
              ),
            ),
          );
        }
      ),
    );
  }
}