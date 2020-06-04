import 'package:covid19monitorbahia/app/shared/storage/model/city_model.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
const String testDevice = 'MobileId';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Covid-19 Bahia"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Game', 'Mario'],
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: 'ca-app-pub-6682437393245746/6677252783',
        //Change BannerAd adUnitId with Admob ID
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd $event");
        });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-6682437393245746~3439595791');
    //'ca-app-pub-6682437393245746~3439595791'
    _bannerAd = createBannerAd()..load()..show();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.add_circle_outline, color: Colors.red,),
              onPressed: () {
                Modular.to.pushNamed('/splash');
              }
          ),
          IconButton(
              icon: Icon(Icons.info_outline, color: Colors.red,),
              onPressed: () {
                _dialogInfo();
              }
          ),
        ],
      ),
      body: Observer(builder: (_) {
        if (controller.cityList.data == null) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.cityList.hasError) {
          return Center(
            child: RaisedButton(
              onPressed: controller.getList,
              child: Text('Error'),
            ),
          );
        } else {
          List<CityModel> list = controller.cityList.data;
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) {
                var model = list[index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      _showDialog(model: model);
                    },
                    title: Text(model.name),
                    leading: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.indigo,
                      ),
                      onPressed: null,
                    ),
                  ),
                );
              }
          );
        }
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          elevation: 3,
          child: Icon(Icons.info_outline, color: Colors.red, size: 30,),
          onPressed: () {
            _dialogInfo();
          }
      ),
    );
  }
    _dialogInfo(){
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text('Informações',textAlign: TextAlign.center,),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Desenvolvido por:\n Orlando Eduardo Pereira\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                  Padding(padding: EdgeInsets.only(top: 0)),
                  Text(
                    "Para atualizar informaçções ou adicionar cidades entre em contato por e-mail:\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 14),),
                  Text("Orlando.Eduardo101@gmail.com",textAlign: TextAlign.center,style: TextStyle(fontSize: 14),),
                ],
              ),
            );
          }
      );
    }
    _showDialog({CityModel model}) {
      model ??= CityModel();
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(model.reference == null ? 'Adicionar' : 'Detalhes'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 5)),
                    TextFormField(
                      enabled: false,
                      initialValue: model.name,
                      //onChanged: (v) => model.name = v,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Cidade',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    TextFormField(
                      enabled: false,
                      initialValue: model.uf,
                      //onChanged: (v) => model.uf = v,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Estado',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    TextFormField(
                      enabled: false,
                      initialValue: model.suspeitos,
                      //onChanged: (v) => model.suspeitos = v,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Suspeitos',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    TextFormField(
                      enabled: false,
                      initialValue: model.confirmados,
                      //onChanged: (v) => model.confirmados = v,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirmados',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    TextFormField(
                      enabled: false,
                      initialValue: model.importados,
                      //onChanged: (v) => model.importados = v,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Importados',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    TextFormField(
                      enabled: false,
                      initialValue: model.monitoramento,
                      //onChanged: (v) => model.monitoramento = v,
                      decoration: InputDecoration(
                        enabled: false,
                        border: OutlineInputBorder(),
                        labelText: 'Monitoramento',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    TextFormField(
                      enabled: false,
                      initialValue: model.descartados,
                      //onChanged: (v) => model.descartados = v,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Descartados',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    TextFormField(
                      enabled: false,
                      initialValue: model.curados,
                      //onChanged: (v) => model.curados = v,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Curados',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5)),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Modular.to.pop();
                  },
                  child: Text('Fechar'),
                ),
              ],
            );
          });
    }
  }


