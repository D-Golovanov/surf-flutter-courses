import 'package:flutter/material.dart';

class Vactination extends StatefulWidget {
  const Vactination({super.key});

  @override
  State<Vactination> createState() => _VactinationState();
}

class _VactinationState extends State<Vactination> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text(
          'Сделаны прививки от:',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.33,
            color: Color(0xFF414657),
          ),
        ),
        const SizedBox(height: 8),
        VactinationCheckBox(
          model: VactinationCheckBoxModel(title: 'бешенства'),
        ),
        VactinationCheckBox(
          model: VactinationCheckBoxModel(title: 'ковида'),
        ),
        VactinationCheckBox(
          model: VactinationCheckBoxModel(title: 'малярии'),
        ),
      ],
    );
  }
}

class VactinationCheckBox extends StatefulWidget {
  final VactinationCheckBoxModel model;
  const VactinationCheckBox({super.key, required this.model});

  @override
  State<VactinationCheckBox> createState() => _VactinationCheckBoxState();
}

class _VactinationCheckBoxState extends State<VactinationCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.model.isSelect = !widget.model.isSelect;
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: widget.model.isSelect
                    ? const Color(0xFFFF8087)
                    : Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: widget.model.isSelect
                  ? const Icon(
                      Icons.check_rounded,
                      size: 16,
                      color: Colors.white,
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(width: 8),
            Text(
              widget.model.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF414657),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VactinationCheckBoxModel {
  final String title;
  bool isSelect = false;

  VactinationCheckBoxModel({required this.title});
}
