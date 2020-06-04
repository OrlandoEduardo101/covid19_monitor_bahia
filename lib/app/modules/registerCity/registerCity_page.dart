import 'package:covid19monitorbahia/app/modules/registerCity/registerCity_controller.dart';
import 'package:covid19monitorbahia/app/shared/storage/model/city_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'registerCity_controller.dart';

class RegisterCityPage extends StatefulWidget {
  final String title;
  const RegisterCityPage({Key key, this.title = "RegisterCity"})
      : super(key: key);

  @override
  _RegisterCityPageState createState() => _RegisterCityPageState();
}

class _RegisterCityPageState
    extends ModularState<RegisterCityPage, RegisterCityController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.add_circle_outline, color: Colors.red,),
              onPressed: (){Modular.to.pushNamed('/addCity');}
          )
        ],
      ),
      body: Observer(builder: (_){
        if(controller.cityList.data == null){
          return Center(child: CircularProgressIndicator());
        } else if (controller.cityList.hasError) {
          return Center(
            child: RaisedButton(
              onPressed: controller.getList,
              child: Text('Error'),
            ),
          );
        }else{
          List<CityModel> list = controller.cityList.data;
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (_,index){
                var model = list[index];
                return Card(
                  child: ListTile(
                    onTap: (){
                      _showDialog(model: model);
                    },
                    title:Text(model.name),
                    leading: IconButton(
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        controller.delete(model);
                      },
                    ),
                  ),
                   );
              }
          );
        }
      })
    );
  }
  _showDialog({CityModel model}) {
    model ??= CityModel();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(model.reference == null ? 'Adicionar' : 'Alterar'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 5)),
                  TextFormField(
                    initialValue: model.name,
                    onChanged: (v) => model.name = v,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cidade',
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  TextFormField(
                    initialValue: model.uf,
                    onChanged: (v) => model.uf = v,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Estado',
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  TextFormField(
                    initialValue: model.suspeitos,
                    onChanged: (v) => model.suspeitos = v,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Suspeitos',
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  TextFormField(
                    initialValue: model.confirmados,
                    onChanged: (v) => model.confirmados = v,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirmados',
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  TextFormField(
                    initialValue: model.importados,
                    onChanged: (v) => model.importados = v,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Importados',
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  TextFormField(
                    initialValue: model.monitoramento,
                    onChanged: (v) => model.monitoramento = v,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Monitoramento',
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  TextFormField(
                    initialValue: model.descartados,
                    onChanged: (v) => model.descartados = v,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Descartados',
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  TextFormField(
                    initialValue: model.curados,
                    onChanged: (v) => model.curados = v,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Curados',
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: Text('Cancelar'),
              ),
              FlatButton(
                onPressed: () {
                  controller.set(model);
                  Modular.to.pop();
                },
                child: Text('Atualizar'),
              ),
            ],
          );
        });
  }
}
