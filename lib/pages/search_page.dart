import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final List<String> fakeMovies = List.generate(
    12,
    (index) => 'assets/movies/movie_$index.jpg',
  );

  final List<String> categories = [
    'Trending',
    'Action',
    'Drama',
    'Comedy',
    'Horror'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          /// AppBar + Search
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 110,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(top: 60, left: 16, right: 16),
                child: TextField(
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
              ),
            ),
          ),

          /// Featured Poster Only
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  fakeMovies[12],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          /// Categories (Red & White Style)
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 8),
                    child: Chip(
                      backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                      label: Text(
                        categories[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          SizedBoxAdapter(height: 16),

          sectionTitle('Popular Picks'),
          horizontalPosterList(fakeMovies),

          sectionTitle('Top 10 Today'),
          horizontalPosterList(fakeMovies.reversed.toList()),

          sectionTitle('Recommended For You'),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      fakeMovies[index % fakeMovies.length],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                childCount: fakeMovies.length,
              ),
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

  /// Reusable: Section Title
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

  /// Reusable: Horizontal Poster List
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

/// Spacer helper
class SizedBoxAdapter extends StatelessWidget {
  final double height;
  const SizedBoxAdapter({required this.height});
  @override
  Widget build(BuildContext context) => SliverToBoxAdapter(
        child: SizedBox(height: height),
      );
}
