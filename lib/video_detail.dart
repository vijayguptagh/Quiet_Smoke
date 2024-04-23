import 'package:flutter/material.dart';
import 'package:news_latest/Model/news_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailVideo extends StatelessWidget {
  const DetailVideo({Key? key, required this.video}) : super(key: key);

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Color.fromARGB(255, 73, 98, 223),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "${video.date}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  video.title,
                  style: const TextStyle(
                    fontSize: 33,
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId:
                          YoutubePlayer.convertUrlToId(video.videoUrl) ?? '',
                      flags: YoutubePlayerFlags(
                        autoPlay: true,
                        mute: false,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                    progressColors: ProgressBarColors(
                      playedColor: Colors.blue,
                      handleColor: Colors.blueAccent,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
                // paceBetweenText(video.description),
                Text(
                  video.summary,
                  style: const TextStyle(
                    fontSize: 21,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
