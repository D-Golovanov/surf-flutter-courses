import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/06_validation/core/theme/app_theme.dart';
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
            color: isActive ? AppColors.red : AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SvgPicture.asset(
            pet.path,
            color: isActive ? AppColors.white : AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          pet.title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.33,
            color: AppColors.textDark,
          ),
        )
      ],
    );
  }
}
