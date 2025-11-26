import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesExercise extends StatefulWidget {
  const SharedPreferencesExercise({super.key});

  @override
  State<SharedPreferencesExercise> createState() => _SharedPreferencesExerciseState();
}

class _SharedPreferencesExerciseState extends State<SharedPreferencesExercise> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  
  String _displayText = 'Chưa có dữ liệu nào được lưu';
  String _lastSavedTime = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('user_name') ?? '';
    final age = prefs.getString('user_age') ?? '';
    final email = prefs.getString('user_email') ?? '';
    final timestamp = prefs.getString('last_saved') ?? '';

    setState(() {
      if (name.isNotEmpty) {
        _displayText = 'Tên: $name';
        if (age.isNotEmpty) _displayText += '\nTuổi: $age';
        if (email.isNotEmpty) _displayText += '\nEmail: $email';
      } else {
        _displayText = 'Chưa có dữ liệu nào được lưu';
      }
      _lastSavedTime = timestamp;
    });
  }

  Future<void> _saveName() async {
    if (_nameController.text.trim().isEmpty) {
      _showSnackBar('Vui lòng nhập tên');
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final timestamp = DateTime.now().toString();
    
    await prefs.setString('user_name', _nameController.text.trim());
    await prefs.setString('last_saved', timestamp);
    
    // Save additional fields if provided
    if (_ageController.text.trim().isNotEmpty) {
      await prefs.setString('user_age', _ageController.text.trim());
    }
    if (_emailController.text.trim().isNotEmpty) {
      await prefs.setString('user_email', _emailController.text.trim());
    }

    _showSnackBar('Dữ liệu đã được lưu thành công!');
    _loadData();
    _clearControllers();
  }

  Future<void> _showName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('user_name');
    final age = prefs.getString('user_age');
    final email = prefs.getString('user_email');

    if (name != null) {
      String message = 'Tên đã lưu: $name';
      if (age != null) message += '\nTuổi: $age';
      if (email != null) message += '\nEmail: $email';
      
      _showSnackBar(message);
    } else {
      _showSnackBar('Chưa có tên nào được lưu');
    }
  }

  Future<void> _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_name');
    await prefs.remove('user_age');
    await prefs.remove('user_email');
    await prefs.remove('last_saved');

    setState(() {
      _displayText = 'Chưa có dữ liệu nào được lưu';
      _lastSavedTime = '';
    });
    _clearControllers();
    _showSnackBar('Dữ liệu đã được xóa thành công!');
  }

  void _clearControllers() {
    _nameController.clear();
    _ageController.clear();
    _emailController.clear();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài Tập SharedPreferences'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input Fields
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Nhập Thông Tin Người Dùng',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Tên *',
                        border: OutlineInputBorder(),
                        hintText: 'Nhập tên của bạn',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _ageController,
                      decoration: const InputDecoration(
                        labelText: 'Tuổi (không bắt buộc)',
                        border: OutlineInputBorder(),
                        hintText: 'Nhập tuổi của bạn',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email (không bắt buộc)',
                        border: OutlineInputBorder(),
                        hintText: 'Nhập email của bạn',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Các nút
            ElevatedButton.icon(
              onPressed: _saveName,
              icon: const Icon(Icons.save),
              label: const Text('Lưu Dữ Liệu'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _showName,
              icon: const Icon(Icons.visibility),
              label: const Text('Hiển Thị Dữ Liệu'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _clearData,
              icon: const Icon(Icons.clear),
              label: const Text('Xóa Dữ Liệu'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 24),

            // Display Area
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Thông Tin Đã Lưu:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _displayText,
                      style: const TextStyle(fontSize: 14),
                    ),
                    if (_lastSavedTime.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Text(
                        'Lần cuối lưu: ${DateTime.parse(_lastSavedTime).toLocal().toString().split('.')[0]}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}