import 'package:flutter/material.dart';

class ContentHobbies extends StatelessWidget {
  const ContentHobbies({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _HobbiseCardWidget(title: 'Спорт', icon: Icons.sports_bar_rounded),
          _HobbiseCardWidget(title: 'Кодить', icon: Icons.terminal_rounded),
          _HobbiseCardWidget(title: 'Животные', icon: Icons.pets_rounded),
          _HobbiseCardWidget(title: 'Еда', icon: Icons.icecream_rounded),
          _HobbiseCardWidget(title: 'Авто', icon: Icons.directions_car_rounded),
          _HobbiseCardWidget(title: 'Путешествия', icon: Icons.nature_rounded),
        ],
      ),
    );
  }
}

class _HobbiseCardWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const _HobbiseCardWidget({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.0,
      height: 90.0,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 4.0),
            Text(title),
          ],
        ),
      ),
    );
  }
}
