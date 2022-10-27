import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class Song {
  final String title;
  final String singer;
  final String imagePath;
  final String songAsset;

  Song(this.title, this.singer, this.imagePath, this.songAsset);
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0;
  int songNo = 0;
  List<Song> songs = [
    Song('Shape of You', 'Ed sheeran', 'assets/images/shapeofyou.png',
        '/shapeofyou.mp3'),
    Song('Slow Dancing in the Dark', 'Joji',
        'assets/images/slowdancinginthedark.jpg', '/slowdancinginthedark.mp3'),
    Song('Sanctuary', 'Joji', 'assets/images/sanctuary.jpg', '/sanctuary.mp3'),
  ];
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final min = twoDigits(duration.inMinutes.remainder(60));
    final sec = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      min,
      sec,
    ].join(':');
  }

  @override
  void initState() {
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newduration) {
      setState(() {
        duration = newduration;
      });
    });
    audioPlayer.onPositionChanged.listen((newposition) {
      setState(() {
        position = newposition;
      });
    });
  }

  Future setAudio() async {
    final player = AudioCache(prefix: 'assets/audio');
    final url = await player.load(songs[songNo].songAsset);
    audioPlayer.setSourceUrl(url.path);
  }

  skipPrevious() async {
    setState(() {
      if (songNo == 0) {
        songNo = 2;
      } else {
        songNo--;
      }
      setAudio();
    });
  }

  skipNext() async {
    setState(() {
      if (songNo == 2) {
        songNo = 0;
      } else {
        songNo++;
      }
      setAudio();
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Music App'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => {setState(() => _selectedIndex = index)},
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedIconTheme: const IconThemeData(size: 30),
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.music_note),
                label: 'Player',
                backgroundColor: Colors.blue.shade900),
            const BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'All Songs',
                backgroundColor: Colors.orange),
          ]),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(songs[songNo].imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    songs[songNo].title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  child: Text(songs[songNo].singer,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: Slider(
                  activeColor: Colors.blue.shade900,
                  inactiveColor: Colors.grey,
                  thumbColor: Colors.cyan,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);
                    await audioPlayer.resume();
                  }),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatTime(position),
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(formatTime(duration - position),
                        style: const TextStyle(color: Colors.white))
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 6, top: 0),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade700, shape: BoxShape.circle),
                    child: IconButton(
                        iconSize: 40,
                        color: Colors.white,
                        onPressed: () async {
                          await skipPrevious();
                        },
                        icon: const Icon(Icons.skip_previous))),
                Container(
                    margin: const EdgeInsets.only(top: 0),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade700, shape: BoxShape.circle),
                    child: IconButton(
                      iconSize: 50,
                      color: Colors.white,
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.resume();
                        }
                      },
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    )),
                Container(
                  margin: const EdgeInsets.only(left: 6, top: 0),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade700, shape: BoxShape.circle),
                  child: IconButton(
                      iconSize: 40,
                      color: Colors.white,
                      onPressed: () async {
                        await skipNext();
                      },
                      icon: const Icon(Icons.skip_next)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
