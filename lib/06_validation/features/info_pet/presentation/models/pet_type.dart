enum TypePet {
  dog(
    title: 'Собака',
    path: 'assets/images/icon-dog.svg',
    vactination: true,
  ),
  cat(
    title: 'Кошка',
    path: 'assets/images/icon-cat.svg',
    vactination: true,
  ),
  parrot(
    title: 'Попугай',
    path: 'assets/images/icon-parrot.svg',
    vactination: false,
  ),
  hamster(
    title: 'Хомяк',
    path: 'assets/images/icon-hamster.svg',
    vactination: false,
  );

  const TypePet({
    required this.title,
    required this.path,
    required this.vactination,
  });
  final String title;
  final String path;
  final bool vactination;
}
