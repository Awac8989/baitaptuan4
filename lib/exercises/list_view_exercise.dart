import 'package:flutter/material.dart';

class ListViewExercise extends StatelessWidget {
  const ListViewExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài Tập List View'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ContactTile(contact: contact);
        },
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final Contact contact;

  const ContactTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: contact.avatarColor,
          child: Text(
            contact.name[0].toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          contact.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact.phone),
            Text(
              contact.email,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        trailing: Icon(
          Icons.call,
          color: Colors.green[600],
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Đang gọi điện cho ${contact.name}...')),
          );
        },
      ),
    );
  }
}

class Contact {
  final String name;
  final String phone;
  final String email;
  final Color avatarColor;

  Contact({
    required this.name,
    required this.phone,
    required this.email,
    required this.avatarColor,
  });
}

final List<Contact> contacts = [
  Contact(
    name: 'Alice Johnson',
    phone: '+1 (555) 123-4567',
    email: 'alice.johnson@email.com',
    avatarColor: Colors.blue,
  ),
  Contact(
    name: 'Bob Smith',
    phone: '+1 (555) 234-5678',
    email: 'bob.smith@email.com',
    avatarColor: Colors.green,
  ),
  Contact(
    name: 'Charlie Brown',
    phone: '+1 (555) 345-6789',
    email: 'charlie.brown@email.com',
    avatarColor: Colors.orange,
  ),
  Contact(
    name: 'Diana Prince',
    phone: '+1 (555) 456-7890',
    email: 'diana.prince@email.com',
    avatarColor: Colors.purple,
  ),
  Contact(
    name: 'Edward Wilson',
    phone: '+1 (555) 567-8901',
    email: 'edward.wilson@email.com',
    avatarColor: Colors.red,
  ),
  Contact(
    name: 'Fiona Davis',
    phone: '+1 (555) 678-9012',
    email: 'fiona.davis@email.com',
    avatarColor: Colors.teal,
  ),
  Contact(
    name: 'George Miller',
    phone: '+1 (555) 789-0123',
    email: 'george.miller@email.com',
    avatarColor: Colors.indigo,
  ),
  Contact(
    name: 'Helen Clark',
    phone: '+1 (555) 890-1234',
    email: 'helen.clark@email.com',
    avatarColor: Colors.pink,
  ),
  Contact(
    name: 'Ian Thompson',
    phone: '+1 (555) 901-2345',
    email: 'ian.thompson@email.com',
    avatarColor: Colors.brown,
  ),
  Contact(
    name: 'Julia Roberts',
    phone: '+1 (555) 012-3456',
    email: 'julia.roberts@email.com',
    avatarColor: Colors.cyan,
  ),
  Contact(
    name: 'Kevin Lee',
    phone: '+1 (555) 123-4567',
    email: 'kevin.lee@email.com',
    avatarColor: Colors.deepOrange,
  ),
  Contact(
    name: 'Lisa Anderson',
    phone: '+1 (555) 234-5678',
    email: 'lisa.anderson@email.com',
    avatarColor: Colors.lime,
  ),
  Contact(
    name: 'Michael Jackson',
    phone: '+1 (555) 345-6789',
    email: 'michael.jackson@email.com',
    avatarColor: Colors.amber,
  ),
  Contact(
    name: 'Nancy Drew',
    phone: '+1 (555) 456-7890',
    email: 'nancy.drew@email.com',
    avatarColor: Colors.lightBlue,
  ),
  Contact(
    name: 'Oliver Twist',
    phone: '+1 (555) 567-8901',
    email: 'oliver.twist@email.com',
    avatarColor: Colors.lightGreen,
  ),
];
