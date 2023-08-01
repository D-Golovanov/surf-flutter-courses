class ColorBox {
  final String title;
  final String hex;

  ColorBox({required this.title, required this.hex});

  ColorBox.fromJSON(Map<String, String> json)
      : title = json['name'] as String,
        hex = json['value'] ?? '';

  @override
  String toString() => '$title - $hex';
}
