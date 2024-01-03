abstract class Validator {
  static String? email(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Введите email';
      }
      if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$')
          .hasMatch(value)) {
        return 'Email введен некорректно';
      }
    }
    return null;
  }

  static String? name(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Введите имя питомца';
      }
      if (value.length < 3 || value.length >= 20) {
        return 'Имя от 3 до 20 символов';
      }
    }
    return null;
  }

  static String? weigth(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Укажите вес, больше 0 кг';
      }
      if (double.tryParse(value) == null || double.tryParse(value) is String) {
        return 'Ошибка! Вес указан некорректно';
      } else {
        if (double.tryParse(value)! <= 0) return 'Укажите вес, больше 0 кг';
      }
    }
    return null;
  }

  static String? date(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Укажите дату дд/мм/гггг';
      }
    }
    return null;
  }
}
