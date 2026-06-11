import 'package:flutter/material.dart';
import 'package:trilink_assignment/api_int/api/model/post_model.dart';
import 'package:trilink_assignment/api_int/api/service/api_service.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiIntegrationState();
}

class _ApiIntegrationState extends State<ApiScreen> {
  final ApiService _apiService = ApiService();

  List<PostModel> posts = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      final data = await _apiService.fetchPosts();

      if (!mounted) return;

      setState(() {
        posts = data;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Integration')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage != null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline),
                  SizedBox(height: 8),
                  Text(errorMessage!),
                ],
              ),
            )
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  ),
                );
              },
            ),
    );
  }
}
