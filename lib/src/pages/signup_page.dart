import 'package:flutter/material.dart';
import '../pages/signin_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sign Up",
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
                    _buildUsernameTextField(),
                    SizedBox(height: 20.0,),
                    _buildEmailTextField(),
                    SizedBox(height: 20.0,),
                    _buildPasswordTextField(),
                    SizedBox(height: 20.0,),
                    _buildConfirmPasswordTextField()
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25.0)
              ),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Divider(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have account ?",
                  style: TextStyle(
                    color: Color(0xFFBDC2CB),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(width: 10.0,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernameTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Username",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildEmailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email",
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

  bool _toogleConfirmVisibility = true;
  Widget _buildConfirmPasswordTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Confirm Password",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                _toogleConfirmVisibility = !_toogleConfirmVisibility;
              });
            },
            icon: _toogleConfirmVisibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
        ),
      ),
      obscureText: _toogleConfirmVisibility,
    );
  }
}
