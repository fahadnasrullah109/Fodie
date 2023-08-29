import 'package:fodei/data/models/home_response.dart';
import 'package:fodei/data/models/resturant.dart';
import 'package:fodei/data/remote/network/api_end_points.dart';
import 'package:fodei/data/remote/network/base_api_service.dart';
import 'package:fodei/data/remote/network/network_api_service.dart';
import 'package:fodei/data/repository/fodie_repository.dart';

class FodieRepositoryImpl implements IFodieRepository {
  BaseApiService apiService = NetworkApiService();

  @override
  Future<HomeResponse?> getHomeItems() async {
    try {
      dynamic response = await apiService.getResponse(ApiEndPoints().getHome);
      final jsonData = HomeResponse.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Resturant>?> getHistory() async {
    try {
      dynamic response =
          await apiService.getResponse(ApiEndPoints().getHistory);
      List<Resturant> itemsList = List<Resturant>.from(
        response.map<Resturant>(
          (dynamic i) => Resturant.fromJson(i),
        ),
      );
      return itemsList;
    } catch (e) {
      rethrow;
    }
  }
}
