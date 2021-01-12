import 'package:flutter/material.dart';
import '../widgets/small_button.dart';
import 'package:auto_size_text/auto_size_text.dart';

class FoodItemCard extends StatelessWidget {

  final String title;
  final String description;
  final String price;

  FoodItemCard(this.title, this.description, this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding:  EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              blurRadius: 5.0,
              offset: Offset(0, 3),
              color: Colors.black12
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "images/breakfast.jpeg"
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0)
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: AutoSizeText(
                    '$title',
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
              ),
              SizedBox(height: 15.0,),
              Container(
                width: 220.0,
                child: Text("$description",
                style: TextStyle(fontSize: 12.0),),
              ),
              SizedBox(height: 15.0,),
              Container(
                width: 220.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Rp. " + "$price", style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue
                    ),),
                    SmallButton(btnText: "Buy",),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
