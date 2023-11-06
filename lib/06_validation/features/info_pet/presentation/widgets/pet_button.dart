import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/06_validation/features/info_pet/presentation/models/pet_type.dart';

class PetButton extends StatelessWidget {
  final TypePet pet;
  final bool isActive;

  const PetButton({
    super.key,
    required this.pet,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFFF8087) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SvgPicture.asset(
            pet.path,
            color: isActive ? Colors.white : const Color(0xFF414657),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          pet.title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.33,
            color: Color(0xFF414657),
          ),
        )
      ],
    );
  }
}
