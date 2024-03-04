import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_samples/src/services/post_service.dart';

import '../post.dart';

class Riverpod4FutureProvider extends ConsumerWidget {
  const Riverpod4FutureProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: FutureBuilder(
        initialData: const [],
        future: ref.watch(postServiceProvider).getPosts(),
        builder: (ctx, snapshot) => _processSnapshot(snapshot),
      ),
    );
  }

  Widget _processSnapshot(AsyncSnapshot<List> snapshot) {
    if (snapshot.connectionState == ConnectionState.active ||
        snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasData) {
        return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (ctx_, idx) => _buildPostTile(snapshot.data![idx]));
      } else {
        return const Center(child: Text("No posts found!"));
      }
    }
    if (snapshot.hasError) {
      return Center(
          child: Text('Error occurred...${snapshot.error.toString()}'));
    }

    return const Center(child: Text('No posts at this time...'));
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Provider Example'),
    );
  }

  _buildPostTile(Post post) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.body),
        leading: Text(post.id.toString()),
        trailing: Text(post.userId.toString()),
      ),
    );
  }
}
