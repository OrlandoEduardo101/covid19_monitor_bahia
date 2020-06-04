import 'package:covid19monitorbahia/app/modules/registerCity/pages/addCity/addCity_controller.dart';
import 'package:covid19monitorbahia/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddCityPage extends StatefulWidget {
  final String title;
  const AddCityPage({Key key, this.title = "AddCity"}) : super(key: key);

  @override
  _AddCityPageState createState() => _AddCityPageState();
}

class _AddCityPageState extends ModularState<AddCityPage, AddCityController> {
  //AddCityController controller = AddCityController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Observer(
          builder: (_){
            return  SingleChildScrollView(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 50, 10, 180),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.8),
                          width: 1,
                        ),
                      ),
                      child: Padding( padding:EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Center(child: Text("Preencha os campos"),),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration:InputDecoration(
                                  //contentPadding: EdgeInsets.only(top: 10, left: 12),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  //labelText: "Nome da Cidade",
                                  hintText: "digite o nome da Cidade",
                                ),
                                style: TextStyle(
                                  fontSize: 15,
                                  //color: Colors.red,
                                  //color: verdeRecode,
                                ),
                                onChanged: (v) => controller.city.name = v,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 3),),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration:InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  //labelText: "Estado",
                                  hintText: "digite o nome do Estado",
                                ),
                                style: TextStyle(
                                  fontSize: 18,
                                  //color: Colors.red,
                                  //color: verdeRecode,
                                ),
                                onChanged:(v) => controller.city.uf = v,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 3),),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration:InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  //labelText: "Casos Suspeitos",
                                  hintText: "digite o nº de casos suspeitos",
                                ),
                                style: TextStyle(
                                  fontSize: 18,
                                  //color: Colors.red,
                                  //color: verdeRecode,
                                ),
                                onChanged: (v) => controller.city.suspeitos = v,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 3),),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration:InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  //labelText: "Casos Confirmado",
                                  hintText: "digite o nº de casos confirmados",
                                ),
                                style: TextStyle(
                                  fontSize: 18,
                                  //color: Colors.red,
                                  //color: verdeRecode,
                                ),
                                onChanged: (v) => controller.city.confirmados = v,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 3),),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration:InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  //labelText: "Casos Importados",
                                  hintText: "digite o nº de casos importados",
                                ),
                                style: TextStyle(
                                  fontSize: 18,
                                  //color: Colors.red,
                                  //color: verdeRecode,
                                ),
                                onChanged: (v) => controller.city.importados = v,                        ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 3),),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration:InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  //labelText: "Monitoramento",
                                  hintText: "nº de casos em monitoramento",
                                ),
                                style: TextStyle(
                                  fontSize: 18,
                                  //color: Colors.red,
                                  //color: verdeRecode,
                                ),
                                onChanged: (v) => controller.city.monitoramento = v,                        ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 3),),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration:InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  //labelText: "Casos Descartados",
                                  hintText: "digite o nº de casos descartados",
                                ),
                                style: TextStyle(
                                  fontSize: 18,
                                  //color: Colors.red,
                                  //color: verdeRecode,
                                ),
                                onChanged: (v) => controller.city.descartados = v,                        ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 3),),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration:InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                                  filled: true,
                                  fillColor: Colors.white,
                                //  labelText: "Curados",
                                  hintText: "digite o nº de pessoas curadas",
                                ),
                                style: TextStyle(
                                  fontSize: 18,
                                  //color: Colors.red,
                                  //color: verdeRecode,
                                ),
                                onChanged: (v) => controller.city.curados = v,                        ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top:5),
                              child: RaisedButton(
                                        elevation: 5,
                                        color: Colors.white,
                                        textColor: Colors.indigo,
                                        padding: EdgeInsets.fromLTRB(18,9,18,9),
                                        child: Text("Enviar", textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                        ),
                                        onPressed: (){
                                          controller.set;
                                          Modular.to.pop();
                                        }
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
