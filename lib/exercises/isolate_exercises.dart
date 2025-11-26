import 'dart:isolate';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IsolateExercises extends StatelessWidget {
  const IsolateExercises({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài Tập Isolate'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: ListTile(
                title: const Text('Thử Thách 1: Tính Toán Nặng'),
                subtitle: const Text('Tính giai thừa sử dụng isolate'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FactorialChallenge()),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                title: const Text('Thử Thách 2: Isolate Nền'),
                subtitle: const Text('Mô phỏng ứng dụng console với isolate'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BackgroundIsolateChallenge()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Challenge 1: Factorial Calculation
class FactorialChallenge extends StatefulWidget {
  const FactorialChallenge({super.key});

  @override
  State<FactorialChallenge> createState() => _FactorialChallengeState();
}

class _FactorialChallengeState extends State<FactorialChallenge> {
  final TextEditingController _numberController = TextEditingController(text: '1000');
  String _result = '';
  bool _isCalculating = false;
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thử Thách Giai Thừa'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tính Toán Nặng với Isolate',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Sử dụng compute() để tính giai thừa trong isolate nền.'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),            TextField(
              controller: _numberController,
              decoration: const InputDecoration(
                labelText: 'Số cần tính giai thừa',
                border: OutlineInputBorder(),
                hintText: 'Nhập số (ví dụ: 1000)',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            
            ElevatedButton(
              onPressed: _isCalculating ? null : _calculateFactorial,
              child: Text(_isCalculating ? 'Đang Tính...' : 'Tính Giai Thừa'),
            ),
            
            if (_isCalculating) ...[
              const SizedBox(height: 16),
              LinearProgressIndicator(value: _progress),
              const SizedBox(height: 8),
              Text('Tiến độ: ${(_progress * 100).toStringAsFixed(1)}%'),
            ],
            
            const SizedBox(height: 24),
            
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Result:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            _result.isEmpty ? 'No calculation performed yet' : _result,
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _calculateFactorial() async {
    final input = _numberController.text.trim();
    final number = int.tryParse(input);
    
    if (number == null || number < 0) {
      setState(() {
        _result = 'Dữ liệu không hợp lệ. Vui lòng nhập số nguyên không âm.';
      });
      return;
    }

    if (number > 10000) {
      setState(() {
        _result = 'Số quá lớn. Vui lòng nhập số ≤ 10000.';
      });
      return;
    }

    setState(() {
      _isCalculating = true;
      _progress = 0.0;
      _result = '';
    });

    try {
      // Simulate progress updates
      for (int i = 0; i <= 10; i++) {
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() {
          _progress = i / 10.0;
        });
      }

      final result = await compute(_computeFactorial, number);
      
      setState(() {
        _isCalculating = false;
        _progress = 1.0;
        if (result.length > 1000) {
          _result = '${result.substring(0, 500)}...\n\n[Kết quả được cắt ngắn - tổng cộng ${result.length} chữ số]';
        } else {
          _result = result;
        }
      });
    } catch (e) {
      setState(() {
        _isCalculating = false;
        _result = 'Lỗi khi tính giai thừa: $e';
      });
    }
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }
}

// Isolate function for factorial calculation
String _computeFactorial(int n) {
  BigInt factorial = BigInt.one;
  for (int i = 1; i <= n; i++) {
    factorial *= BigInt.from(i);
  }
  return factorial.toString();
}

// Challenge 2: Background Isolate Communication
class BackgroundIsolateChallenge extends StatefulWidget {
  const BackgroundIsolateChallenge({super.key});

  @override
  State<BackgroundIsolateChallenge> createState() => _BackgroundIsolateChallengeState();
}

class _BackgroundIsolateChallengeState extends State<BackgroundIsolateChallenge> {
  final List<String> _messages = [];
  Isolate? _workerIsolate;
  ReceivePort? _receivePort;
  SendPort? _sendPort;
  bool _isRunning = false;
  int _currentSum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isolate Nền'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Giao Tiếp Isolate Nền',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Isolate worker gửi số ngẫu nhiên, isolate chính tính tổng.'),
                    const Text('Khi tổng > 100, isolate worker dừng lại.'),
                    const SizedBox(height: 16),
                    Text(
                      'Tổng Hiện Tại: $_currentSum',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isRunning ? null : _startWorkerIsolate,
                    child: const Text('Bắt Đầu Worker'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: !_isRunning ? null : _stopWorkerIsolate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Dừng Worker'),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          Expanded(
            child: Card(
              margin: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Tin Nhắn:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            message,
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'monospace',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _startWorkerIsolate() async {
    _receivePort = ReceivePort();
    
    setState(() {
      _isRunning = true;
      _currentSum = 0;
      _messages.clear();
      _messages.add('[${DateTime.now()}] Đang bắt đầu isolate worker...');
    });

    try {
      _workerIsolate = await Isolate.spawn(
        _workerEntryPoint,
        _receivePort!.sendPort,
      );

      _receivePort!.listen((message) {
        if (message is Map<String, dynamic>) {
          if (message['type'] == 'number') {
            final number = message['value'] as int;
            setState(() {
              _currentSum += number;
              _messages.add('[${DateTime.now()}] Nhận: $number (Tổng: $_currentSum)');
            });

            if (_currentSum > 100) {
              _sendPort?.send({'type': 'stop'});
              setState(() {
                _messages.add('[${DateTime.now()}] Tổng vượt quá 100, gửi lệnh dừng...');
              });
            }
          } else if (message['type'] == 'ready') {
            _sendPort = message['sendPort'];
            setState(() {
              _messages.add('[${DateTime.now()}] Isolate worker sẵn sàng');
            });
          } else if (message['type'] == 'stopped') {
            setState(() {
              _messages.add('[${DateTime.now()}] Isolate worker dừng một cách ổn định');
              _isRunning = false;
            });
            _cleanup();
          }
        }
      });
    } catch (e) {
      setState(() {
        _messages.add('[${DateTime.now()}] Lỗi: $e');
        _isRunning = false;
      });
      _cleanup();
    }
  }

  void _stopWorkerIsolate() {
    _sendPort?.send({'type': 'stop'});
    setState(() {
      _messages.add('[${DateTime.now()}] Yêu cầu dừng thủ công');
    });
  }

  void _cleanup() {
    _workerIsolate?.kill();
    _receivePort?.close();
    _workerIsolate = null;
    _receivePort = null;
    _sendPort = null;
  }

  @override
  void dispose() {
    _cleanup();
    super.dispose();
  }
}

// Worker isolate entry point
void _workerEntryPoint(SendPort mainSendPort) async {
  final receivePort = ReceivePort();
  final random = Random();
  bool shouldStop = false;

  // Send our SendPort to main isolate
  mainSendPort.send({
    'type': 'ready',
    'sendPort': receivePort.sendPort,
  });

  // Listen for stop commands
  receivePort.listen((message) {
    if (message is Map<String, dynamic> && message['type'] == 'stop') {
      shouldStop = true;
    }
  });

  // Generate and send random numbers
  while (!shouldStop) {
    await Future.delayed(const Duration(seconds: 1));
    
    if (!shouldStop) {
      final randomNumber = random.nextInt(20) + 1; // 1-20
      mainSendPort.send({
        'type': 'number',
        'value': randomNumber,
      });
    }
  }

  // Notify main isolate that we're stopping
  mainSendPort.send({'type': 'stopped'});
  
  // Clean exit
  receivePort.close();
  Isolate.exit();
}