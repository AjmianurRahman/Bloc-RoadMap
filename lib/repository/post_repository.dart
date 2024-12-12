import 'dart:convert';

import 'package:block_roadmap/model/PostsModel.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostsModel>> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e){
          return PostsModel(
            postId: e['postId'],
            email: e['email'] as String,
            body: e['body'] as String,
          );
        }).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
