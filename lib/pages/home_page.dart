import 'package:flutter/material.dart';
import 'film_screen.dart';
import 'series_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFeaturedMovie(context),
              const SizedBox(height: 20),
              _buildCategorySlider(),
              const SizedBox(height: 20),
              _buildPosterSection("Newest", [
                'assets/images/spiderman.jpg',
                'assets/images/ca.jpg',
                'assets/images/mufasa.jpg',
                'assets/images/logan.jpg',
              ]),
              const SizedBox(height: 20),
              _buildPosterSection("Movies", [
                'assets/images/ffh.jpg',
                'assets/images/batman.jpg',
                'assets/images/oppen.jpg',
                'assets/images/gundam_screen.jpg',
              ]),
              const SizedBox(height: 20),
              _buildPosterSection("Series", [
                'assets/images/witcher.jpg',
                'assets/images/got.jpg',
                'assets/images/loki.jpg',
                'assets/images/loki.jpg',
              ]),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedMovie(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/gundam_screen.jpg',
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black, Colors.transparent],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 70,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "MOBILE SUIT GUNDAM",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Fantasy", style: TextStyle(color: Colors.white70)),
                  _dotSeparator(),
                  Text("2019", style: TextStyle(color: Colors.white70)),
                  _dotSeparator(),
                  Text("Series", style: TextStyle(color: Colors.white70)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FilmScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 184, 22, 10),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    icon: const Icon(Icons.play_arrow, color: Colors.white),
                    label: const Text(
                      "Play",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    icon: const Icon(Icons.add, color: Colors.black),
                    label: const Text(
                      "My List",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySlider() {
    final categories = [
      {"title": "TV Shows", "image": "assets/images/pb.jpeg"},
      {"title": "Movies", "image": "assets/images/mcu.jpeg"},
      {"title": "Series", "image": "assets/images/secin.jpg"},
    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 12),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    item['image']!,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red.withOpacity(0.5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    item['title']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPosterSection(String title, List<String> posters) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: posters.length,
            itemBuilder: (context, index) {
              return MouseRegion(
                cursor: SystemMouseCursors.click, // Untuk cursor pointer di web
                child: GestureDetector(
                  onTap: () {
                    // Navigasi tergantung pada kategori
                    if (title == "Series") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SeriesScreen()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FilmScreen()),
                      );
                    }
                  },
                  child: Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(posters[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _dotSeparator extends StatelessWidget {
  const _dotSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Text("•", style: TextStyle(color: Colors.white70)),
    );
  }
}
