import 'package:flutter/material.dart';
import 'package:fodei/data/models/resturant.dart';
import 'package:fodei/data/remote/response/api_response.dart';
import 'package:fodei/data/repository/fodie_repository_impl.dart';

class HistoryViewModel with ChangeNotifier {
  final repo = FodieRepositoryImpl();

  ApiResponse<List<Resturant>?> historyResponse = ApiResponse.loading();

  void setHistoryResonse(ApiResponse<List<Resturant>?> response) {
    historyResponse = response;
    notifyListeners();
  }

  Future<void> fetchHistoryFromServer() async {
    setHistoryResonse(ApiResponse.loading());
    repo
        .getHistory()
        .then((value) => setHistoryResonse(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            setHistoryResonse(ApiResponse.error(error.toString())));
  }
}
