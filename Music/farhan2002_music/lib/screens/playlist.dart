// import 'package:flutter/material.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';

// class Playlist extends StatefulWidget {
//   const Playlist({Key? key}) : super(key: key);

//   @override
//   State<Playlist> createState() => _PlaylistState();
// }

// class _PlaylistState extends State<Playlist> {
//   final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
//   final audios = <Audio>[
//     //Audio.network(
//     //  'https://d14nt81hc5bide.cloudfront.net/U7ZRzzHfk8pvmW28sziKKPzK',
//     //  metas: Metas(
//     //    id: 'Invalid',
//     //    title: 'Invalid',
//     //    artist: 'Florent Champigny',
//     //    album: 'OnlineAlbum',
//     //    image: MetasImage.network(
//     //        'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
//     //  ),
//     //),
//     Audio.network(
//       'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/springtide/Sounds_strange_weird_but_unmistakably_romantic_Vol1/springtide_-_03_-_We_Are_Heading_to_the_East.mp3',
//       metas: Metas(
//         id: 'Online',
//         title: 'Online',
//         artist: 'Florent Champigny',
//         album: 'OnlineAlbum',
//         // image: MetasImage.network('https://www.google.com')
//         image: const MetasImage.network(
//             'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
//       ),
//     ),
//     Audio(
//       'assets/audios/rock.mp3',
//       //playSpeed: 2.0,
//       metas: Metas(
//         id: 'Rock',
//         title: 'Rock',
//         artist: 'Florent Champigny',
//         album: 'RockAlbum',
//         image: const MetasImage.network(
//             'https://static.radio.fr/images/broadcasts/cb/ef/2075/c300.png'),
//       ),
//     ),
//     Audio(
//       'assets/shapeofyou.mp3',
//       metas: Metas(
//         id: 'Country',
//         title: 'Country',
//         artist: 'Florent Champigny',
//         album: 'CountryAlbum',
//         image: const MetasImage.asset('assets/shapeofyou.png'),
//       ),
//     ),
//     Audio(
//       'assets/audios/electronic.mp3',
//       metas: Metas(
//         id: 'Electronics',
//         title: 'Electronic',
//         artist: 'Florent Champigny',
//         album: 'ElectronicAlbum',
//         image: const MetasImage.network(
//             'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/12/attachment_68585523.jpg'),
//       ),
//     ),
//     Audio(
//       'assets/audios/hiphop.mp3',
//       metas: Metas(
//         id: 'Hiphop',
//         title: 'HipHop',
//         artist: 'Florent Champigny',
//         album: 'HipHopAlbum',
//         image: const MetasImage.network(
//             'https://beyoudancestudio.ch/wp-content/uploads/2019/01/apprendre-danser.hiphop-1.jpg'),
//       ),
//     ),
//     Audio(
//       'assets/audios/pop.mp3',
//       metas: Metas(
//         id: 'Pop',
//         title: 'Pop',
//         artist: 'Florent Champigny',
//         album: 'PopAlbum',
//         image: const MetasImage.network(
//             'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
//       ),
//     ),
//     Audio(
//       'assets/audios/instrumental.mp3',
//       metas: Metas(
//         id: 'Instrumental',
//         title: 'Instrumental',
//         artist: 'Florent Champigny',
//         album: 'InstrumentalAlbum',
//         image: const MetasImage.network(
//             'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/12/attachment_68585523.jpg'),
//       ),
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     audioPlayer.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
