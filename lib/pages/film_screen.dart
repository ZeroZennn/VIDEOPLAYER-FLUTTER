import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'watch_movie.dart';
import 'dart:ui';

class FilmScreen extends StatelessWidget {
  const FilmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gambar Cuplikan Film
            Stack(
              children: [
                Image.asset(
                  'assets/images/gundam_screen.jpg',
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                    child: Container(color: Colors.black.withOpacity(0.3)),
                  ),
                ),
                // Positioned.fill(
                //   child: Container(
                //     decoration: const BoxDecoration(
                //       gradient: LinearGradient(
                //         begin: Alignment.bottomCenter,
                //         end: Alignment.topCenter,
                //         colors: [Colors.black87, Colors.transparent],
                //       ),
                //     ),
                //   ),
                // ),
                // Title + Info
                Positioned(
                  bottom: 120,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "MOBILE SUIT GUNDAM",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Fantasy",
                            style: TextStyle(color: Colors.white70),
                          ),
                          _dotSeparator(),
                          const Text(
                            "2019",
                            style: TextStyle(color: Colors.white70),
                          ),
                          _dotSeparator(),
                          const Text(
                            "Movie",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Box Rating
                Positioned(
                  bottom: 80,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 18),
                        const SizedBox(width: 5),
                        const Text(
                          "7.5",
                          style: TextStyle(color: Colors.white),
                        ),
                        _divider(),
                        const Text(
                          "2023",
                          style: TextStyle(color: Colors.white),
                        ),
                        _divider(),
                        const Text(
                          "12+",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                // Buttons
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 184, 22, 10),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const WatchMovieScreen(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Watch Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () => _showTrailerPopup(context),
                          icon: const Icon(
                            Icons.ondemand_video,
                            color: Color.fromARGB(255, 184, 22, 10),
                          ),
                          label: const Text(
                            "Watch Trailer",
                            style: TextStyle(
                              color: Color.fromARGB(255, 184, 22, 10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // // Tombol Watch Now dan Trailer
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: ElevatedButton.icon(
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: Colors.red,
            //             shape: const StadiumBorder(),
            //           ),
            //           onPressed: () {
            //             Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (context) => const WatchMovieScreen(),
            //               ),
            //             );
            //           },

            //           icon: const Icon(Icons.play_arrow),
            //           label: const Text(
            //             "Watch Now",
            //             style: TextStyle(color: Colors.white),
            //           ),
            //         ),
            //       ),
            //       const SizedBox(width: 10),
            //       Expanded(
            //         child: OutlinedButton.icon(
            //           style: OutlinedButton.styleFrom(
            //             backgroundColor: Colors.white,
            //             shape: const StadiumBorder(),
            //           ),
            //           onPressed: () => _showTrailerPopup(context),
            //           icon: const Icon(Icons.ondemand_video, color: Colors.red),
            //           label: const Text(
            //             "Watch Trailer",
            //             style: TextStyle(color: Colors.red),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 20),

            // Deskripsi Film
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mobile Suit Gundam 00: Awakening of the Trailblazer",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Gundam 00's entire plot revolved around the teachings of a mythical figure, Aeolia Schenberg, who aspired to eliminate war in the case that humanity makes contact with aliens someday. In the movie that followed the series, that case came about quickly! Despite its obvious problems with pacing and storytelling, this movie is perhaps worth a watch for the sole fact that it dared to ask a question no other Gundam show has: “What if Gundam, but with aliens?” One can't deny that this movie took some risks with its premise and the 00 canon. \n\n"
                    "Even though many of them didn't pay off, I admire this movie's unusual worldbuilding and innovative action scenes.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Like/Dislike + Action Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.thumb_up, color: Colors.white),
                            SizedBox(width: 5),
                            Text("10K", style: TextStyle(color: Colors.white)),
                            SizedBox(width: 10),
                            Icon(Icons.thumb_down, color: Colors.white),
                            SizedBox(width: 5),
                            Text("259", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          _roundedIcon(Icons.bookmark),
                          const SizedBox(width: 10),
                          _roundedIcon(Icons.share),
                          const SizedBox(width: 10),
                          _roundedIcon(Icons.download),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Cast & Crew
                  const Text(
                    "Cast & Crew",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 130,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _castItem(
                          "assets/images/mamoru.png",
                          "Actor",
                          "Mamoru Miyano",
                        ),
                        _castItem(
                          "assets/images/haruka.png",
                          "Actor",
                          "Haruka Tomatsu",
                        ),
                        _castItem(
                          "assets/images/miki.png",
                          "Actor",
                          "Shin'ichirô Miki",
                        ),
                        _castItem(
                          "assets/images/rie.png",
                          "Actress",
                          "Rie Kugimiya",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roundedIcon(IconData icon) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white10,
      ),
      padding: const EdgeInsets.all(10),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  // widget cast item
  Widget _castItem(String assetPath, String role, String name) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 70,
      child: Column(
        children: [
          CircleAvatar(radius: 28, backgroundImage: AssetImage(assetPath)),
          const SizedBox(height: 5),
          Text(
            role,
            style: const TextStyle(fontSize: 11, color: Colors.white54),
            textAlign: TextAlign.center,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 12, color: Colors.white),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  static Widget _dotSeparator() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: Text("•", style: TextStyle(color: Colors.white70)),
  );

  Widget _divider() => Container(
    height: 12,
    width: 1,
    color: Colors.white24,
    margin: const EdgeInsets.symmetric(horizontal: 10),
  );

  void _showTrailerPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(
        0.7,
      ), // latar belakang transparan gelap
      builder: (context) {
        return Center(child: TrailerPlayer());
      },
    );
  }
}

class TrailerPlayer extends StatefulWidget {
  const TrailerPlayer({super.key});

  @override
  State<TrailerPlayer> createState() => _TrailerPlayerState();
}

class _TrailerPlayerState extends State<TrailerPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController = VideoPlayerController.asset(
      'assets/videos/gundam_trailer.mp4', // Ganti sesuai lokasi file kamu
    );

    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      allowFullScreen: true,
      aspectRatio: _videoPlayerController.value.aspectRatio,
    );

    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.8),
      child: Stack(
        children: [
          Center(
            child:
                _chewieController != null &&
                        _chewieController!
                            .videoPlayerController
                            .value
                            .isInitialized
                    ? Chewie(controller: _chewieController!)
                    : const CircularProgressIndicator(color: Colors.white),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); // Tutup popup
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white24,
                child: Icon(Icons.close, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
