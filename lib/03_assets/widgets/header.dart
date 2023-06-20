import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String firstName;
  final String secondName;
  final String quote;

  const Header(
      {super.key,
      required this.firstName,
      required this.secondName,
      required this.quote});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage('assets/images/duck_ava.jpg'),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        firstName,
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Text(
                          secondName,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 24.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    quote,
                    maxLines: 3,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
