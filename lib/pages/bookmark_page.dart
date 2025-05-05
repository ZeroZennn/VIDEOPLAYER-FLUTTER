import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  final List<Movie> bookmarkedMovies = [
    Movie(
      title: 'Pengepungan di Bukit Duri',
      duration: '1j 58m',
      genre: 'Drama, Thriller',
      director: 'Joko Anwar',
      rating: 'D 17+',
      poster: 'assets/movies/movie_9.jpg',
      viewers: '1.2M',
      stars: 4.5,
    ),
    Movie(
      title: 'Queen Tears',
      duration: '1j 12m',
      genre: 'Romance, Drama',
      director: 'Kim Hee-won',
      rating: '13+',
      poster: 'assets/movies/movie_0.jpg',
      viewers: '950K',
      stars: 4.7,
    ),
    Movie(
      title: 'Stranger Things',
      duration: '2j 3m',
      genre: 'Sci-Fi, Thriller',
      director: 'Duffer Brothers',
      rating: 'D 17+',
      poster: 'assets/movies/movie_1.jpg',
      viewers: '2.3M',
      stars: 4.9,
    ),
  ];

  BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
        children: [
          Text(
            'My Watchlist',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 20),
          ...bookmarkedMovies.map((movie) => _buildMovieCard(movie)).toList(),
        ],
      ),
    );
  }

  Widget _buildMovieCard(Movie movie) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Poster & bottom row (stars & viewers)
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      movie.poster,
                      height: 130,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.amber),
                      SizedBox(width: 4),
                      Text(
                        '${movie.stars}',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.visibility, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        movie.viewers,
                        style: TextStyle(color: Colors.grey[300]),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 12),

              /// Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Text(
                      movie.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6),

                    _infoRow('Genre', movie.genre),
                    _infoRow('Durasi', movie.duration),
                    _infoRow('Sutradara', movie.director),

                    /// Rating Usia
                    Row(
                      children: [
                        Text(
                          'Rating Usia:',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 184, 22, 10),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            movie.rating,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    /// Play Button
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            184,
                            22,
                            10,
                          ),
                          foregroundColor: const Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: Icon(
                          Icons.play_arrow,
                          size: 20,
                          color: Colors.white,
                        ),
                        label: Text('Play'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        /// Bookmark Icon (pojok kanan atas)
        Positioned(
          top: 8,
          right: 8,
          child: Icon(
            Icons.bookmark,
            color: const Color.fromARGB(255, 255, 247, 0),
          ),
        ),
      ],
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: TextStyle(color: Colors.grey)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class Movie {
  final String title;
  final String duration;
  final String genre;
  final String director;
  final String rating;
  final String poster;
  final String viewers;
  final double stars;

  Movie({
    required this.title,
    required this.duration,
    required this.genre,
    required this.director,
    required this.rating,
    required this.poster,
    required this.viewers,
    required this.stars,
  });
}
