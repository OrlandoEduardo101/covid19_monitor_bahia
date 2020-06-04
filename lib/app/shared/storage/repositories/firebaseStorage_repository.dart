import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid19monitorbahia/app/shared/storage/model/city_model.dart';
import 'package:covid19monitorbahia/app/shared/storage/repositories/firebaseStorage_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseStorageRepository extends Disposable implements IFirebaseStorageRepository{
  final Firestore firestore;

  FirebaseStorageRepository(this.firestore);

  /*Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }*/

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  deleteData(CityModel model) {
    return model.reference.delete();
  }

  @override
  Future<Stream<CityModel>> getByDocumentId(String documentId) async {
    return firestore.collection('city').document(documentId).snapshots().map(
            (event) => CityModel.fromDocument(event)
    );
  }

  @override
  Stream<List<CityModel>> getData() {
    return firestore.collection('city').orderBy('name').snapshots().map((event) => event.documents.map(
            (e) => CityModel.fromDocument(e)).toList()
    );
  }

  @override
  Future setData(CityModel model) async {
    print('Model: '+model.name);

    var total = (await Firestore.instance.collection('city').getDocuments()).documents.length;
     //firestore.collection('city').document('asd').setData(map);
    if(model.reference == null){
      model.reference = await Firestore.instance.collection('city').add({
        'name': model.name,
        'uf': model.uf,
        'suspeitos': model.suspeitos,
        'confirmados': model.confirmados,
        'importados': model.importados,
        'monitoramento': model.monitoramento,
        'descartados': model.descartados,
        'curados': model.curados,
        'obitos': model.obitos,
      });
    } else {
      model.reference.updateData({
        'name': model.name,
        'uf': model.uf,
        'suspeitos': model.suspeitos,
        'confirmados': model.confirmados,
        'importados': model.importados,
        'monitoramento': model.monitoramento,
        'descartados': model.descartados,
        'curados': model.curados,
        'obitos': model.obitos,
      });
      }
    }

  @override
  updateData(String id, CityModel model) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
