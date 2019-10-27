import 'package:dio/dio.dart';

class MovieApiService{
  String _apiKey = "fea5cee2ca1f5f8d6c93fa4769131cd2";
  String _baseUrl = "https://api.themoviedb.org/3/";
  final Dio _dio = Dio();
  String _errorMsg = "No internet connection.";

  MovieApiService(){
   // Set default configs
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 3000; //3s
  }


  /// Get the top rated movies from theMovieDB api
  Future<ApiResponse> getTopRatedMovies(int page) async {
    try {
      Response response = await _dio.get("movie/top_rated", queryParameters: {
        "api_key": _apiKey,
        "page": page,
        "language": "en-US"
      });
      print(response.data.toString());
      return ApiResponse(
          results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured");
      return ApiResponse(
          results: null, error: _errorMsg, hasResponse: false);
    }
  }

}

class ApiResponse {
  final Map<String, dynamic> results;
  final String error;
  bool hasResponse;
  ApiResponse({this.results, this.error, this.hasResponse});
}