class ApiEndPoints {
  final String baseUrl = "https://fahadnasrullah109.github.io/fodie/";
  final String getHome = "home.json";
  final String getHistory = "history.json";

  String getImageUrl(String imagePath) {
    return "${baseUrl}images/$imagePath";
  }
}
