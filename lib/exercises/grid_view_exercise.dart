import 'package:flutter/material.dart';

class GridViewExercise extends StatelessWidget {
  const GridViewExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài Tập Grid View'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Phần 1: GridView.count()
            const Text(
              'Lưới Cột Cố Định',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 400,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
                children: List.generate(12, (index) {
                  return GridItem(
                    icon: gridIcons[index],
                    label: 'Mục ${index + 1}',
                    color: gridColors[index % gridColors.length],
                  );
                }),
              ),
            ),
            const SizedBox(height: 32),
            
            // Phần 2: GridView.extent()
            const Text(
              'Lưới Linh Hoạt',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 400,
              child: GridView.extent(
                maxCrossAxisExtent: 150,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
                children: List.generate(12, (index) {
                  return GridItem(
                    icon: gridIcons[index],
                    label: 'Mục ${index + 1}',
                    color: gridColors[index % gridColors.length],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const GridItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: color,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Icons for the grid items
final List<IconData> gridIcons = [
  Icons.home,
  Icons.star,
  Icons.favorite,
  Icons.settings,
  Icons.camera,
  Icons.music_note,
  Icons.phone,
  Icons.email,
  Icons.location_on,
  Icons.calendar_today,
  Icons.shopping_cart,
  Icons.account_circle,
];

// Colors for the grid items
final List<Color> gridColors = [
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.purple,
  Colors.red,
  Colors.teal,
  Colors.indigo,
  Colors.pink,
  Colors.brown,
  Colors.cyan,
  Colors.deepOrange,
  Colors.lime,
];