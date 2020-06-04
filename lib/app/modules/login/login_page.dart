import 'package:covid19monitorbahia/app/shared/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'components/textError/textError_widget.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  final LoginController controller = Modular.get();
  final TextErrorWidget textErrorWidget = TextErrorWidget();

  //TextEditingController _controllerUser = TextEditingController();
  //TextEditingController _controllerPassword = TextEditingController();
  IconData _account = IconData(59475, fontFamily: 'MaterialIcons');
  IconData _lock = IconData(59545, fontFamily: 'MaterialIcons');
  //Image _account_circle = ImageIcon(Icons.account_circle.) as Image;
  Image _logo_recode = Image.asset('image/logo_jr.png',);



  @override
  Widget build(BuildContext context) {
    //Color verdeRecode = verdeRecode;
    return Scaffold(
      backgroundColor: verdeRecode,

      body:
      SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.fromLTRB(10, 180, 10, 180),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.8),
                    width: 1,
                  ),
                ),
                child: Padding( padding:EdgeInsets.fromLTRB(20, 90, 30, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration:InputDecoration(
                          fillColor: verdeRecode,
                          prefixIcon:Icon(_account,),
                          labelText: "User",
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          //color: Colors.red,
                          //color: verdeRecode,
                        ),
                        onChanged: controller.setEmail,
                      ),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration:InputDecoration(
                          prefixIcon:Icon(_lock),
                          labelText: "Password",
                        ),
                        obscureText: true,
                        style: TextStyle(
                            fontSize: 18
                        ),
                        onChanged: controller.setPassword,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:5),
                        child:textErrorWidget
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:5),
                        child: Observer(
                            builder: (_){
                                return RaisedButton(
                                elevation: 5,
                                color: verdeRecode,
                                textColor: Colors.white,
                                padding: EdgeInsets.fromLTRB(18,9,18,9),
                                child: Text("Login", textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                                onPressed: controller.password.isEmpty ? null : controller.loginWithEmail,
                              );
                            }
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 25, bottom: 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width:150,
                              child: GestureDetector(
                                child: Text(
                                  "Esqueci minha senha",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey
                                  ),
                                ),
                                onTap: (){
                                  FirebaseAuth.instance.sendPasswordResetEmail(email: controller.email);
                                },
                              ),
                            ),
                            /*SizedBox(
                              width: 130,
                              child: GestureDetector(
                                child: Text(
                                  "Cadastre-se",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey
                                  ),
                                ),
                                onTap: (){
                                  print("cadastre-se");
                                },
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(80, 80, 80, 10),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(1), //fromRGBO(64, 64, 64, 10),
                  border: Border.all(
                    color: verdeRecode, //withOpacity(0.9),
                    width: 3,
                  ),
                ),
                child: Icon(Icons.account_circle, size: 180, color: Colors.indigo,),//_account_circle, //Image(image: _account_circle,/*image: 180,color: Colors.white,*/),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
