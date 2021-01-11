import 'package:flutter/material.dart';
import 'package:food_app/src/widgets/button.dart';
import '../pages/signup_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sign In",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0,),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(height: 20.0,),
                    _buildPasswordTextField(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Button(btnText: "Sign In"),
            Divider(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have account ?",
                  style: TextStyle(
                    color: Color(0xFFBDC2CB),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(width: 10.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Forgotten Password ?",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your email",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }

  bool _toogleVisibility = true;
  Widget _buildPasswordTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              _toogleVisibility = !_toogleVisibility;
            });
          },
          icon: _toogleVisibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
        ),
      ),
      obscureText: _toogleVisibility,
    );
  }
}
