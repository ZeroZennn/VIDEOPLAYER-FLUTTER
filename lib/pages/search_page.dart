import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final List<String> fakeMovies = List.generate(
    13,
    (index) => 'assets/movies/movie_$index.jpg',
  );

  final List<String> categories = [
    'Trending',
    'Action',
    'Drama',
    'Comedy',
    'Horror',
  ];

  final Map<String, String> categoryImages = {
    'Trending': 'assets/genres/trending.jpg',
    'Action': 'assets/genres/action.png',
    'Drama': 'assets/genres/drama.jpg',
    'Comedy': 'assets/genres/comedy.jpg',
    'Horror': 'assets/genres/horror.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          /// Header: Logo + Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset('assets/images/net.jpg', height: 40),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search movies, shows, genres...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[900],
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBoxAdapter(height: 16),

          /// Featured Poster with label
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Image.asset(
                      fakeMovies[12],
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'MOST WATCHED',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Genre Buttons Scrollable
          SliverToBoxAdapter(
            child: Container(
              height: 30,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final imagePath = categoryImages[category]!;
                  return Container(
                    width: 80,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.45),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          shadows: [
                            Shadow(
                              blurRadius: 4,
                              color: Colors.black,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          SizedBoxAdapter(height: 16),

          /// Section: Popular Picks
          sectionTitle('Popular Picks'),
          horizontalPosterList(fakeMovies),

          /// Section: Top 10 Today
          sectionTitle('Top 10 Today'),
          horizontalPosterList(fakeMovies.reversed.toList()),

          /// Section: Recommended For You (Grid)
          sectionTitle('Recommended For You'),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    fakeMovies[index % fakeMovies.length],
                    fit: BoxFit.cover,
                  ),
                );
              }, childCount: fakeMovies.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2 / 3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable Section Title
  SliverToBoxAdapter sectionTitle(String title) => SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  /// Reusable Horizontal Poster List
  SliverToBoxAdapter horizontalPosterList(List<String> posters) =>
      SliverToBoxAdapter(
        child: Container(
          height: 160,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: posters.length,
            itemBuilder: (context, index) {
              return Container(
                width: 110,
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(posters[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      );
}

class SizedBoxAdapter extends StatelessWidget {
  final double height;
  const SizedBoxAdapter({required this.height});
  @override
  Widget build(BuildContext context) =>
      SliverToBoxAdapter(child: SizedBox(height: height));
}
