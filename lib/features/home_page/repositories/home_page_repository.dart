import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:venturo_core/features/home_page/models/books.dart';

class HomePageRepository {
  final String baseUrl = 'https://67c6a9bf351c081993fe3162.mockapi.io/libgo/api/v1/books';
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<List<Book>> getAllBooks() async {
    try {
      _logger.d('Fetching books from $baseUrl');
      final response = await _dio.get(baseUrl);
      _logger.d('API response status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        List<Book> books = (response.data as List).map((json) => Book.fromJson(json)).toList();
        _logger.d('Fetched ${books.length} books');
        return books;
      } else {
        _logger.e('Failed to load books, status code: ${response.statusCode}');
        throw Exception('Failed to load books');
      }
    } catch (e) {
      _logger.e('Failed to load books: $e');
      throw Exception('Failed to load books: $e');
    }
  }
}