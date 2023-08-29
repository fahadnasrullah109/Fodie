import 'package:fodei/data/models/home_response.dart';
import 'package:fodei/data/models/resturant.dart';

abstract class IFodieRepository {
  Future<HomeResponse?> getHomeItems();
  Future<List<Resturant>?> getHistory();
}
