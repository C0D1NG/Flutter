class SplashItem {
  const SplashItem({
    required this.svgPicture,
    required this.title,
  });
  final String svgPicture;
  final String title;
}

const listSplashItem = <SplashItem>[
  SplashItem(
    svgPicture: 'assets/images/1.svg',
    title: 'Cocok untuk investor pemula',
  ),
  SplashItem(
    svgPicture: 'assets/images/2.svg',
    title: 'Diawasi oleh OJK',
  ),
  SplashItem(
    svgPicture: 'assets/images/3.svg',
    title: 'Tunjukkan investasimu dengan fitur goal planner PNM SiJago',
  ),
  SplashItem(
    svgPicture: 'assets/images/4.svg',
    title: 'Pantau portfoliomu menggunakan aplikasi SiJago',
  ),
];
