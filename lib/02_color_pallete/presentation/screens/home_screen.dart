import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/data/models/color_box_model.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/data/models/colors_list_model.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/data/repository/color_box_impl.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/data/source/color_box_local_data_source.dart';
import 'package:surf_flutter_courses_template/02_color_pallete/presentation/widgets/app_bar_sliver_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ColorsListModel> _colorPallete;
  final repository =
      ColorBoxRepositoryImpl(data: ColorBoxLocalDataSourceImpl());

  @override
  void initState() {
    super.initState();
    debugPrint('init state');

    _colorPallete = repository.getColorBoxes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const AppBarSliverWidget(),
          FutureBuilder(
            future: _colorPallete,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return SliverPadding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 40, right: 16),
                    sliver: SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20,
                        crossAxisCount: 3,
                        mainAxisExtent: 180,
                      ),
                      itemCount: snapshot.data?.colorsList.length,
                      itemBuilder: (context, index) => ColorBoxCellWidget(
                        colorBox: snapshot.data!.colorsList[index],
                      ),
                    ),
                  );
                } else {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text('Ups...'),
                    ),
                  );
                }
              } else {
                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class ColorBoxCellWidget extends StatefulWidget {
  final ColorBoxModel colorBox;

  const ColorBoxCellWidget({
    super.key,
    required this.colorBox,
  });

  @override
  State<ColorBoxCellWidget> createState() => _ColorBoxCellWidgetState();
}

class _ColorBoxCellWidgetState extends State<ColorBoxCellWidget> {
  late Timer _timer;
  double _scaleWidget = 1.0;

  @override
  Widget build(BuildContext context) {
    final colorInt =
        int.parse('0xFF${widget.colorBox.hex.replaceAll('#', '')}');

    return GestureDetector(
      onLongPressStart: (details) {
        debugPrint('onLongPressStart');
        _timer = Timer.periodic(const Duration(milliseconds: 24), (timer) {
          setState(() {
            _scaleWidget = _scaleWidget - 0.01;
            if (_scaleWidget < 0.9) {
              _timer.cancel();
            }
          });
        });
      },
      onLongPressEnd: (details) {
        debugPrint('onLongPressEnd');
        _timer.cancel();
        setState(() => _scaleWidget = 1.0);
      },
      onLongPress: () =>
          copyClipBoard(context: context, value: widget.colorBox.hex),
      onTap: () {},
      /*
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailColorScreen(
            colorBox: widget.colorBox,
          ),
        ),
      ),*/
      child: Transform.scale(
        scale: _scaleWidget,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Color(colorInt),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${widget.colorBox.title}\n${widget.colorBox.hex}',
              style: const TextStyle(
                color: Color(0xFF252838),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 16 / 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void copyClipBoard(
    {required BuildContext context, required String value}) async {
  await Clipboard.setData(ClipboardData(text: value));
  final copyData = await Clipboard.getData(Clipboard.kTextPlain);

  if (!context.mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 800),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: const Color(0xCC090E2E),
      elevation: 0,
      content: Center(
        child: Text(
          '${copyData?.text} скопирован',
          style: const TextStyle(
              color: Colors.white, fontSize: 16, height: 16 / 16),
        ),
      ),
    ),
  );
}
