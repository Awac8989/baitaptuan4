import 'package:flutter/material.dart';

class AsyncExercise extends StatefulWidget {
  const AsyncExercise({super.key});

  @override
  State<AsyncExercise> createState() => _AsyncExerciseState();
}

class _AsyncExerciseState extends State<AsyncExercise> {
  String _status = 'Sẵn sàng tải người dùng';
  bool _isLoading = false;

  Future<void> _loadUser() async {
    setState(() {
      _isLoading = true;
      _status = 'Đang tải người dùng...';
    });

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isLoading = false;
      _status = 'Tải người dùng thành công!';
    });

    // Reset after 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _status = 'Sẵn sàng tải người dùng';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lập Trình Bất Đồng Bộ'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Status icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _getStatusColor().withOpacity(0.2),
                  border: Border.all(
                    color: _getStatusColor(),
                    width: 3,
                  ),
                ),
                child: Center(
                  child: _isLoading
                      ? CircularProgressIndicator(
                          color: _getStatusColor(),
                          strokeWidth: 3,
                        )
                      : Icon(
                          _getStatusIcon(),
                          size: 60,
                          color: _getStatusColor(),
                        ),
                ),
              ),
              const SizedBox(height: 32),

              // Status text
              Text(
                _status,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Load user button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _loadUser,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: _isLoading ? Colors.grey : Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    _isLoading ? 'Đang tải...' : 'Tải Người Dùng',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Additional demo buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _simulateQuickTask,
                      child: const Text('Tháo Tác Nhanh'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _simulateSlowTask,
                      child: const Text('Tháo Tác Chậm'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Information card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const Text(
                      'Demo Lập Trình Bất Đồng Bộ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Demo này cho thấy:',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const Text('• Future.delayed() cho các thao tác bất đồng bộ'),
                    const Text('• Quản lý trạng thái tải'),
                    const Text('• Cập nhật UI với setState()'),
                    const Text('• Xử lý chu trình sống của widget'),
                  ],
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _simulateQuickTask() async {
    setState(() {
      _isLoading = true;
      _status = 'Đang chạy thao tác nhanh...';
    });

    await Future.delayed(const Duration(milliseconds: 800));

    setState(() {
      _isLoading = false;
      _status = 'Thao tác nhanh hoàn thành!';
    });

    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() {
        _status = 'Sẵn sàng tải người dùng';
      });
    }
  }

  Future<void> _simulateSlowTask() async {
    setState(() {
      _isLoading = true;
      _status = 'Đang xử lý công việc nặng...';
    });

    await Future.delayed(const Duration(seconds: 5));

    setState(() {
      _isLoading = false;
      _status = 'Công việc nặng hoàn thành!';
    });

    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() {
        _status = 'Sẵn sàng tải người dùng';
      });
    }
  }

  Color _getStatusColor() {
    if (_isLoading) return Colors.orange;
    if (_status.contains('thành công') || _status.contains('hoàn thành')) {
      return Colors.green;
    }
    return Colors.blue;
  }

  IconData _getStatusIcon() {
    if (_status.contains('thành công') || _status.contains('hoàn thành')) {
      return Icons.check_circle;
    }
    return Icons.person;
  }
}