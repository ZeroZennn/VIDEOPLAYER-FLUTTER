import 'package:flutter/material.dart';

class SeriesScreen extends StatefulWidget {
  const SeriesScreen({super.key});

  @override
  State<SeriesScreen> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedSeason = 'Season 1';

  final List<String> _seasons = ['Season 1', 'Season 2'];
  final Map<String, List<Map<String, String>>> _episodesBySeason = {
    'Season 1': [
      {
        "title": "The End’s Beginning",
        "desc": "Episode 1",
        "image": "assets/images/episode1.jpg",
      },
      {
        "title": "Four Marks",
        "desc": "Episode 2",
        "image": "assets/images/episode2.jpg",
      },
      {
        "title": "Betrayer Moon",
        "desc": "Episode 3",
        "image": "assets/images/episode3.png",
      },
    ],
    'Season 2': [
      {
        "title": "A Grain of Truth",
        "desc": "Episode 1",
        "image": "assets/images/episode4.jpg",
      },
      {
        "title": "Kaer Morhen",
        "desc": "Episode 2",
        "image": "assets/images/episode5.jpg",
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Widget _dotSeparator() => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Text("•", style: TextStyle(color: Colors.white70)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/the_witcher.jpg',
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
                    bottom: 60,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "THE WITCHER",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Fantasy",
                              style: TextStyle(color: Colors.white70),
                            ),
                            Text(
                              "  •  ",
                              style: TextStyle(color: Colors.white70),
                            ),
                            Text(
                              "2019",
                              style: TextStyle(color: Colors.white70),
                            ),
                            Text(
                              "  •  ",
                              style: TextStyle(color: Colors.white70),
                            ),
                            Text(
                              "1 Season",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 184, 22, 10),
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Play",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Geralt of Rivia, a mutated monster-hunter for hire, journeys toward his destiny in a turbulent world where people often prove more wicked than beasts.",
                  style: TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height: 20),

              TabBar(
                controller: _tabController,
                indicatorColor: Color.fromARGB(255, 184, 22, 10),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white54,
                tabs: const [
                  Tab(text: "Episodes"),
                  Tab(text: "Trailers & More"),
                  Tab(text: "More Like This"),
                ],
              ),

              SizedBox(
                height: 500,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey[700]!),
                              ),
                            ),
                            child: Theme(
                              data: Theme.of(
                                context,
                              ).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                collapsedIconColor: Colors.white,
                                iconColor: Colors.white,
                                title: Text(
                                  _selectedSeason,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                children:
                                    _seasons.map((season) {
                                      return ListTile(
                                        title: Text(
                                          season,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _selectedSeason = season;
                                          });
                                        },
                                      );
                                    }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                _episodesBySeason[_selectedSeason]?.length ?? 0,
                            itemBuilder: (context, index) {
                              final episode =
                                  _episodesBySeason[_selectedSeason]![index];
                              return ListTile(
                                leading: Image.asset(
                                  episode["image"]!,
                                  width: 100,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(
                                  episode["title"]!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  episode["desc"]!,
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                trailing: const Icon(
                                  Icons.download,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const Center(
                      child: Text(
                        "Trailers & More",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "More Like This",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
