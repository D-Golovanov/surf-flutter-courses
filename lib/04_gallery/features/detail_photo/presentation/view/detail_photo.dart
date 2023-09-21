import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/04_gallery/mock_photos.dart';

class DetailPhoto extends StatefulWidget {
  final int numberPhoto;

  const DetailPhoto({
    super.key,
    required this.numberPhoto,
  });

  @override
  State<DetailPhoto> createState() => _DetailPhotoState();
}

class _DetailPhotoState extends State<DetailPhoto> {
  late int currentPhoto;
  late final _pageController = PageController(
    initialPage: widget.numberPhoto,
    viewportFraction: 0.75,
  );

  void _changePhotoNumber() {
    setState(() {
      currentPhoto = _pageController.page!.round();
    });
  }

  @override
  void initState() {
    currentPhoto = widget.numberPhoto;
    _pageController.addListener(_changePhotoNumber);

    super.initState();
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_changePhotoNumber)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color(0xFF222222),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: Text.rich(
                TextSpan(
                  text: '${currentPhoto + 1}',
                  style: const TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.36,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '/${mockPhotos.length}',
                      style: const TextStyle(
                        color: Color(0xFFBFBFBF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        itemCount: mockPhotos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Hero(
              tag: index,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 300),
                scale: currentPhoto == index ? 1 : 0.8,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: NetworkImage(mockPhotos[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
