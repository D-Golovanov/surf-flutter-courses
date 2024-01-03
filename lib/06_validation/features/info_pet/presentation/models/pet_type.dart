enum TypePet {
  dog(title: 'Собака', path: 'assets/images/icon-dog.svg'),
  cat(title: 'Кошка', path: 'assets/images/icon-cat.svg'),
  parrot(title: 'Попугай', path: 'assets/images/icon-parrot.svg'),
  hamster(title: 'Хомяк', path: 'assets/images/icon-hamster.svg');

  const TypePet({required this.title, required this.path});
  final String title;
  final String path;
}
