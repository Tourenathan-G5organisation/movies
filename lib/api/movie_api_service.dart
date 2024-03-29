import 'package:dio/dio.dart';

class MovieApiService {
  String _apiKey = "fea5cee2ca1f5f8d6c93fa4769131cd2";
  String _baseUrl = "https://api.themoviedb.org/3/";
  final Dio _dio = Dio();
  String _errorMsg = "No internet connection.";

  MovieApiService() {
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
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured");
      return ApiResponse(results: null, error: _errorMsg, hasResponse: false);
    }
  }

  /// Get the most popular movies from theMovieDB api
  Future<ApiResponse> getPopularMovies(int page) async {
    try {
      Response response = await _dio.get("movie/popular", queryParameters: {
        "api_key": _apiKey,
        "page": page,
        "language": "en-US"
      });
      print(response.data.toString());
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured on getting popular movies");
      return ApiResponse(results: null, error: _errorMsg, hasResponse: false);
    }
  }

  /// Get the now playing movies from theMovieDB api
  Future<ApiResponse> getNowPlayingMovies(int page) async {
    try {
      Response response = await _dio.get("movie/now_playing", queryParameters: {
        "api_key": _apiKey,
        "page": page,
        "language": "en-US"
      });
      print(response.data.toString());
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured");
      return ApiResponse(results: null, error: _errorMsg, hasResponse: false);
    }
  }

  /// Get the movie details from theMovieDb api
  Future<ApiResponse> getMovieDetails(int movieID) async {
    try {
      Response response = await _dio.get("movie/$movieID",
          queryParameters: {"api_key": _apiKey, "language": "en-US"});
      print(response.data.toString());
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured on getting the details");
      return ApiResponse(results: null, error: _errorMsg, hasResponse: false);
    }
  }

  /// Get the movie images from theMovieDb api
  Future<ApiResponse> getMovieImages(int movieID) async {
    try {
      Response response = await _dio.get("movie/$movieID/images",
          queryParameters: {"api_key": _apiKey, "include_image_language": "en,null"});
      print(response.data.toString());
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured on getting the movie images");
      return ApiResponse(results: null, error: _errorMsg, hasResponse: false);
    }
  }

  /// Get the movie actors from theMovieDb api
  Future<ApiResponse> getMovieActors(int movieID) async {
    try {
      Response response = await _dio.get("movie/$movieID/credits",
          queryParameters: {"api_key": _apiKey});
      print(response.data.toString());
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured on getting the movie actors");
    return ApiResponse(results: null, error: _errorMsg, hasResponse: false);}
  }

  /// Get the movie vidoes from theMovieDb api
  Future<ApiResponse> getMovieVideo(int movieID) async {
    try {
      Response response = await _dio.get("movie/$movieID/videos",
          queryParameters: {"api_key": _apiKey, "language": "en-US"});
      print(response.data.toString());
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured on getting the movie actors");
      return ApiResponse(results: null, error: _errorMsg, hasResponse: false);}
  }

  /// Get the top rated TV programs from theMovieDB api
  Future<ApiResponse> getTopRatedTV(int page) async {
    try {
      Response response = await _dio.get("tv/top_rated", queryParameters: {
        "api_key": _apiKey,
        "page": page,
        "language": "en-US"
      });
      print(response.data.toString());
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured");
      return ApiResponse(results: null, error: _errorMsg, hasResponse: false);
    }
  }

  /// Get the popular TV programs from theMovieDB api
  Future<ApiResponse> getPopularTV(int page) async {
    try {
      Response response = await _dio.get("tv/popular", queryParameters: {
        "api_key": _apiKey,
        "page": page,
        "language": "en-US"
      });
      print(response.data.toString());
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured");
      return ApiResponse(results: null, error: _errorMsg, hasResponse: false);
    }
  }

  /// Get the "On the Air" TV programs from theMovieDB api
  Future<ApiResponse> getOnTheAirTV(int page) async {
    try {
      Response response = await _dio.get("tv/on_the_air", queryParameters: {
        "api_key": _apiKey,
        "page": page,
        "language": "en-US"
      });
      print(response.data.toString());
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured");
      return ApiResponse(results: null, error: _errorMsg, hasResponse: false);
    }
  }

  /// Get the popular people in TMDB database
  Future<ApiResponse> getPopularPeople(int page) async {
    try {
      Response response = await _dio.get("person/popular", queryParameters: {
        "api_key": _apiKey,
        "page": page,
        "language": "en-US"
      });
      print(response.data.toString());
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured");
      return ApiResponse(results: null, error: _errorMsg, hasResponse: false);
    }
  }

  /// Get the TV program details from theMovieDb api
  Future<ApiResponse> getTvDetails(int tvID) async {
    try {
      Response response = await _dio.get("tv/$tvID",
          queryParameters: {"api_key": _apiKey, "language": "en-US"});
      print(response.data.toString());
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured on getting the details");
      return ApiResponse(results: null, error: _errorMsg, hasResponse: false);
    }
  }

  /// Get the TV actors from theMovieDb api
  Future<ApiResponse> getTVActors(int tvID) async {
    try {
      Response response = await _dio.get("tv/$tvID/credits",
          queryParameters: {"api_key": _apiKey});
      print(response.data.toString());
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured on getting the tv actors");
      return ApiResponse(results: null, error: _errorMsg, hasResponse: false);}
  }

  /// Get the TV images from theMovieDb api
  Future<ApiResponse> getTVImages(int tvID) async {
    try {
      Response response = await _dio.get("tv/$tvID/images",
          queryParameters: {"api_key": _apiKey, "include_image_language": "en,null"});
      print(response.data.toString());
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured on getting the tv images");
      return ApiResponse(results: null, error: _errorMsg, hasResponse: false);
    }
  }

  // Search for a movie from theMovieDb api
  Future<ApiResponse> searchMovie(String searchText, int page) async {
    try {
      Response response = await _dio.get("search/movie",
          queryParameters: {"api_key": _apiKey, "query": searchText, "page": page, "language": "en-US"});
      print(response.data.toString());
      return ApiResponse(results: response.data, error: "", hasResponse: true);
    } on DioError catch (e) {
      print("An error occured on searching for movie");
      return ApiResponse(results: null, error: _errorMsg, hasResponse: false);
    }
  }
}

class ApiResponse {
  final Map<String, dynamic> results;
  final String error;
  bool hasResponse;

  ApiResponse({this.results, this.error, this.hasResponse});
}
