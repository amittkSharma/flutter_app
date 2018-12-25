import 'dart:convert';

import 'package:flutter/material.dart';
import '../libraries/rest-api.dart';

class Post {
  final int userId;
  final String body;
  final String title;

  Post({this.userId, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'] as int,
        body: json['body'] as String,
        title: json['title'] as String);
  }
}

class ListPage extends StatelessWidget {
  final String _title = 'All Posts';
  final RestApi _api = new RestApi();

  List<Post> parsePost(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }

  Future<List<Post>> getPosts() async {
    final response = await _api.getAll('/posts');

    var list = parsePost(response.body);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text(this._title),
      ),
      body: FutureBuilder<List<Post>>(
        future: getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print('Error $snapshot.error');

          return snapshot.hasData
              ? PostListView(posts: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}

class PostListView extends StatelessWidget {
  final List<Post> posts;
  PostListView({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      separatorBuilder: (context, index) => Divider(
            color: Colors.red,
          ),
      itemCount: this.posts.length,
      itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(this.posts[index].title),
              subtitle: Text(this.posts[index].body),
            ),
          ),
    );
  }
}
