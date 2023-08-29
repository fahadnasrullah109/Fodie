import 'package:flutter/material.dart';
import 'package:fodei/data/models/home_response.dart';
import 'package:fodei/data/remote/response/api_response.dart';
import 'package:fodei/data/repository/fodie_repository_impl.dart';

class HomeViewModel with ChangeNotifier {
  final repo = FodieRepositoryImpl();

  ApiResponse<HomeResponse> homeResponse = ApiResponse.loading();

  void setHomeResonse(ApiResponse<HomeResponse> response) {
    homeResponse = response;
    notifyListeners();
  }

  Future<void> fetchHomeItemsFromServer() async {
    setHomeResonse(ApiResponse.loading());
    repo
        .getHomeItems()
        .then((value) => setHomeResonse(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            setHomeResonse(ApiResponse.error(error.toString())));
  }
}
