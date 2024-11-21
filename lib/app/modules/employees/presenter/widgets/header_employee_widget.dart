import 'package:flutter/material.dart';

class HeaderEmployeeWidget extends StatelessWidget {
  const HeaderEmployeeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const CircleAvatar(
          radius: 20,
          child: Text('CG'),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
      ],
    );
  }
}
