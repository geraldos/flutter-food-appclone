import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/widgets/custom_list_tile.dart';
import '../widgets/small_button.dart';

class ProfilePage extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<ProfilePage> {

  bool turnOnNotifiactions = false;
  bool turnOnLocations = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Profile", style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 20.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          offset: Offset(
                            0, 4.0
                          ),
                          color: Colors.black38,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(
                          "images/breakfast.jpeg",),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Richmond Blankson", style: TextStyle(
                        fontSize: 18.0,
                      ),),
                      SizedBox(height: 10.0,),
                      Text("+628888888888880", style: TextStyle(
                        color: Colors.grey
                      ),),
                      SizedBox(height: 20.0,),
                      SmallButton(btnText: "Edit",),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Text("Account", style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10.0,),
              Card(
                elevation: 3.0,
                child: Padding(
                  padding: EdgeInsets.all(
                    16.0
                  ),
                  child: Column(
                    children: <Widget>[
                      CustomListTile(
                        icon: Icons.location_on,
                        text: "Location",
                      ),
                      Divider(height: 10.0,color: Colors.grey),
                      CustomListTile(
                        icon: Icons.visibility,
                        text: "Change Password",
                      ),
                      Divider(height: 11.0,color: Colors.grey),
                      CustomListTile(
                        icon: Icons.shopping_cart,
                        text: "Shipping",
                      ),
                      Divider(height: 10.0,color: Colors.grey),
                      CustomListTile(
                        icon: Icons.credit_card,
                        text: "Payment",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Text("Notifications", style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10.0,),
              Card(
                elevation: 3.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("App Notifications",
                          style: TextStyle(
                            fontSize: 16.0
                          ),),
                          Switch(
                            value: turnOnNotifiactions,
                            onChanged: (bool value){
                              setState(() {
                                turnOnNotifiactions = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(height: 11.0,color: Colors.grey),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Location Tracking",
                            style: TextStyle(
                                fontSize: 16.0
                            ),),
                          Switch(
                            value: turnOnLocations,
                            onChanged: (bool value){
                              setState(() {
                                turnOnLocations = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Text("Others", style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10.0,),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Language", style: TextStyle(fontSize: 16.0),),
                        Divider(height: 30.0,color: Colors.grey),
                        Text("Currency", style: TextStyle(fontSize: 16.0),),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}