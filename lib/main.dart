import 'package:flutter/material.dart';
import 'exercises/list_view_exercise.dart';
import 'exercises/grid_view_exercise.dart';
import 'exercises/shared_preferences_exercise.dart';
import 'exercises/async_exercise.dart';
import 'exercises/isolate_exercises.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bài Tập Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài Tập Flutter'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ExerciseCard(
            title: '1. Bài Tập List View',
            description: 'Danh sách cuộn của các liên hệ với hình đại diện',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListViewExercise()),
            ),
          ),
          ExerciseCard(
            title: '2. Bài Tập Grid View',
            description: 'Thư viện với GridView.count() và GridView.extent()',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GridViewExercise()),
            ),
          ),
          ExerciseCard(
            title: '3. Bài Tập SharedPreferences',
            description: 'Lưu và truy xuất dữ liệu người dùng cục bộ',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SharedPreferencesExercise()),
            ),
          ),
          ExerciseCard(
            title: '4. Lập Trình Bất Đồng Bộ',
            description: 'Trạng thái tải và các thao tác bất đồng bộ',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AsyncExercise()),
            ),
          ),
          ExerciseCard(
            title: '5. Bài Tập Isolate',
            description: 'Tính toán nặng với isolate',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const IsolateExercises()),
            ),
          ),
        ],
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const ExerciseCard({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
