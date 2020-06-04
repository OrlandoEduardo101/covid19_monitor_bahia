import 'package:covid19monitorbahia/app/shared/storage/model/city_model.dart';

abstract class IFirebaseStorageRepository{
  Stream<List<CityModel>> getData();
  Future setData(CityModel model);
  updateData(String id, CityModel model);
  Future deleteData(CityModel model);
  Future<Stream<CityModel>> getByDocumentId(String documentId);
}