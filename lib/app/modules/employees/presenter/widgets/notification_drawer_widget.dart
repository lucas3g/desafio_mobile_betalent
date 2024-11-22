import 'package:flutter/material.dart';

class NotificationDrawerWidget extends StatelessWidget {
  const NotificationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Lucas enviou o currículo'),
            subtitle: const Text('Hoje as 18:00'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Lucas enviou o currículo'),
            subtitle: const Text('Hoje as 14:00'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
