import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class Song {
  final String title;
  final String singer;
  final String imagePath;
  final String songAsset;

  Song(this.title, this.singer, this.imagePath, this.songAsset);
}

class _PlayScreenState extends State<PlayScreen> {
  Color? vibrantColor = Colors.white;
  Color? lightVibrantColor = Colors.white;
  List<Song> songs = [
    Song('Kesariya', 'Arijit Singh', 'assets/songs/kesariya.jpeg',
        'songs/Kesariya.mp3'),
    Song('Let Me Down Slowly', 'Alex Benjamin', 'assets/songs/let-me-down.jpeg',
        'songs/Let-Me-Down-Slowly.mp3'),
    Song('All We Know', 'The Chainsmokers', 'assets/songs/all-we-know.jpeg',
        'songs/All-We-Know.mp3'),
  ];

  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    getImageColor(songs[0].imagePath);

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  getImageColor(String img) async {
    var image = Image(image: AssetImage(img)).image;
    vibrantColor = await getVibrantColor(image);
    lightVibrantColor = await getLightVibrantColor(image);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Top in India: English',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              vibrantColor ?? Colors.black12,
              lightVibrantColor ?? Colors.white
            ],
          ),
        ),
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          onPageChanged: (index) {
            getImageColor(songs[index].imagePath);
            player.play(AssetSource(songs[index].songAsset));
            setState(() {
              isPlaying = true;
            });
          },
          itemCount: songs.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Center(
                  child: Image.asset(
                    songs[index].imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Row(
                      //   children: [Text('Alex')],
                      // ),
                      // StreamBuilder(
                      //   stream: bloc.play_stream,
                      //   builder: (context, snapshot) {
                      //     return Text(
                      //       snapshot.data.toString(),
                      //       style: TextStyle(fontSize: 28),
                      //     );
                      //   },
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    CupertinoIcons.suit_heart_fill,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  Icon(
                                    CupertinoIcons.chat_bubble_text_fill,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  Icon(
                                    CupertinoIcons.add_circled_solid,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 50),
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    CupertinoIcons.arrow_down_to_line,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  Icon(
                                    CupertinoIcons.repeat_1,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(isPlaying
                                ? Icons.pause
                                : Icons.play_arrow_rounded),
                            color: Colors.white,
                            iconSize: 50,
                            onPressed: () async {
                              if (isPlaying) {
                                await player.pause();
                              } else {
                                await player.play(
                                  AssetSource(songs[index].songAsset),
                                );
                              }
                            },
                          ),
                          const SizedBox(width: 20),
                          // Flexible(
                          //   child: LinearProgressIndicator(
                          //     value: 0.4,
                          //     color: Colors.white,
                          //     backgroundColor: Colors.white.withOpacity(0.4),
                          //   ),
                          // ),
                          Flexible(
                            child: Slider(
                              min: 0,
                              max: duration.inSeconds.toDouble(),
                              value: position.inSeconds.toDouble(),
                              onChanged: (value) async {
                                final position =
                                    Duration(seconds: value.toInt());
                                await player.seek(position);

                                await player.resume();
                              },
                              activeColor: Colors.white,

                              // color: Colors.white,
                              // backgroundColor: Colors.white.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Future<Color?>? getVibrantColor(ImageProvider<Object> imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.lightVibrantColor?.color;
  }

  Future<Color?>? getLightVibrantColor(
      ImageProvider<Object> imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.darkVibrantColor?.color;
  }
}
