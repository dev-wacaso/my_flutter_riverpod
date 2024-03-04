import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../post.dart';

final postServiceProvider = Provider<PostService>((ref) => PostService());

// final userDataProvider =
//     FutureProvider<List<Post>>((ref) => ref.read(postServiceProvider).getPosts());

class PostService {
  final String endpoint = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPosts() async {
    await Future.delayed(const Duration(seconds: 1), () => null);
    Response resp = await get(Uri.parse(endpoint));
    
    if (200 == resp.statusCode) {

      final List rslt = jsonDecode(resp.body);
      return rslt.map((p) => Post.fromJson(p)).toList();
    } else {
      throw Exception(resp.reasonPhrase);
    }
  }

  // _buildPostTile(Post post) {
  //   return ListTile(
  //     title: Text(post.title),
  //     subtitle: Text(post.body),
  //     leading: Text(post.id.toString()),
  //     trailing: Text(post.userId.toString()),
  //   );
  // }
}
