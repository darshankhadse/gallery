import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../models/pixabay_image.dart';

class HomeController extends GetxController {
  var images = <PixabayImage>[].obs;
  var isLoading = false.obs;
  var page = 1;
  var query = ''.obs;
  final int itemsPerPage = 30;
  final apiKey = '45929895-d1c4649cee8281fa47589992d';

  @override
  void onInit() {
    debounce(query, (_) => searchImages(query.value));
    fetchImages();
    super.onInit();
  }

  Future<void> fetchImages([String searchQuery = '']) async {
    if (isLoading.value) return;
    isLoading(true);
    final url = Uri.parse(
      'https://pixabay.com/api/?key=$apiKey&category=$searchQuery&image_type=photo&per_page=$itemsPerPage&page=$page',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List newImages = data['hits'];

      images.addAll(newImages.map((e) => PixabayImage.fromJson(e)).toList());
      page++;
    }
    isLoading(false);
  }

  void searchImages(String query) {
    images.clear();
    page = 1;
    fetchImages(query);
  }
}
