import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/04_gallery/features/detail_photo/presentation/view/detail_photo.dart';
import 'package:surf_flutter_courses_template/04_gallery/mock_photos.dart';

class MySliverGrid extends StatelessWidget {
  const MySliverGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      sliver: SliverGrid.builder(
        itemCount: mockPhotos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 3,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailPhoto(numberPhoto: index),
              ),
            );
          },
          child: Hero(
            tag: index,
            child: Image.network(
              mockPhotos[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
