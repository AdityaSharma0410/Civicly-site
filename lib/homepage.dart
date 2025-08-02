import '../settings.dart';
import 'package:flutter/material.dart';
import '../navigation_bar.dart';
// import 'meditation.dart';
import '../reports_page.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  String welcomeText = "";
  String nameText = "";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkIfNewUser();
    });
  }

  Future<void> _checkIfNewUser() async {
    final prefs = await SharedPreferences.getInstance();
    bool isUser = prefs.getBool('isuser') ?? false; // default false
    String? savedName = prefs.getString('name');
    if (mounted) {
      setState(() {
        welcomeText = isUser ? "Welcome back" : "Welcome";
        nameText = savedName ?? "User";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 3) {
            // Navigate to the SettingsPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          }
          if (index == 1) {
            // Navigate to the SettingsPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReportsPage()),
            );
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },

        // onTap: (index) {
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // },
      ),
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: Padding(
      //       padding: const EdgeInsets.all(24.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           SizedBox(
      //             height: 3.0,
      //           ),
      //           Text(
      //             "Welcome back,",
      //             style: TextStyle(
      //                 fontSize: 25.5,
      //                 fontWeight: FontWeight.bold,
      //                 color: Colors.black87),
      //           ),
      //           SizedBox(height: 4),
      //           Text(
      //             "Ujjwal",
      //             style: TextStyle(
      //               fontSize: 23,
      //               fontWeight: FontWeight.w600,
      //               color: Colors.teal[700],
      //             ),
      //           ),
      //           SizedBox(height: 6),
      //           Text(
      //             "Let's cultivate mindfulness today",
      //             style: TextStyle(
      //                 fontSize: 14.5,
      //                 color: Colors.black54,
      //                 fontWeight: FontWeight.w600),
      //           ),
      //           SizedBox(height: 5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row with Welcome and Notification Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$welcomeText,",
                      style: TextStyle(
                        fontSize: 25.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications_none),
                      iconSize: 26,
                      color: Colors.black54,
                      onPressed: () {
                        // TODO: Navigate to notifications page or show dialog
                      },
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  "$nameText",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: Colors.teal[700],
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Empowering you to fix and improve.",
                  style: TextStyle(
                    fontSize: 14.5,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),

                // ElevatedButton(
                //   onPressed: () {
                //     // Trigger Focus Mode
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.teal[400],
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(16),
                //     ),
                //     padding: const EdgeInsets.symmetric(
                //       vertical: 18,
                //       horizontal: 24,
                //     ),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             "Start Focus Mode",
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.w600,
                //             ),
                //           ),
                //           Text(
                //             "Minimize distractions",
                //             style: TextStyle(fontSize: 12, color: Colors.white70),
                //           ),
                //         ],
                //       ),
                //       Icon(Icons.play_circle_fill, size: 32, color: Colors.white),
                //     ],
                //   ),
                // ),
                // SizedBox(height: 40),
                // Container(
                //   padding: const EdgeInsets.all(16),
                //   decoration: BoxDecoration(
                //     color: Colors.orange.shade50,
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   child: Row(
                //     children: [
                //       Icon(Icons.play_circle_outline,
                //           size: 32, color: Colors.orange),
                //       SizedBox(width: 16),
                //       Expanded(
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               "Tanpura Sound",
                //               style: TextStyle(
                //                   fontSize: 16, fontWeight: FontWeight.w500),
                //             ),
                //             SizedBox(height: 6),
                //             LinearProgressIndicator(
                //               value: 0.3,
                //               color: Colors.orange,
                //               backgroundColor: Colors.orange[100],
                //             ),
                //           ],
                //         ),
                //       ),
                //       SizedBox(width: 16),
                //       Column(
                //         children: [
                //           Container(
                //             padding:
                //                 EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                //             decoration: BoxDecoration(
                //               color: Colors.orange[200],
                //               borderRadius: BorderRadius.circular(8),
                //             ),
                //             child: Text(
                //               "10 min",
                //               style: TextStyle(
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //           ),
                //           SizedBox(height: 8),
                //           Text(
                //             "More >",
                //             style: TextStyle(
                //               fontSize: 12,
                //               color: Colors.teal,
                //             ),
                //           )
                //         ],
                //       )
                //     ],
                //   ),
                // ),

                IssuesCard(),
                SizedBox(height: 24),
                // FocusStatsCard(),
                CategorySelector(
                  onCategorySelected: (String) {},
                ),
                SizedBox(
                  height: 22,
                ),
                RecentReportsHeader(),
                SizedBox(
                  height: 20,
                ),
                RecentReports(),
                // RewardsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IssuesCard extends StatelessWidget {
  const IssuesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFB),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title bar with arrow
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Issues Near You",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black54,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Main icon
          Center(
            child: Column(
              children: [
                Icon(
                  Icons.map,
                  size: 42,
                  color: Colors.blueAccent,
                ),
                const SizedBox(height: 6),
                const Text(
                  "Interactive Map",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Colored dots
          SizedBox(
            height: 24,
            child: Stack(
              children: const [
                Positioned(
                  left: 10,
                  top: 2,
                  child: CircleAvatar(radius: 6, backgroundColor: Colors.green),
                ),
                Positioned(
                  right: 10,
                  top: 2,
                  child:
                      CircleAvatar(radius: 6, backgroundColor: Colors.orange),
                ),
                Positioned(
                  left: 40,
                  bottom: 0,
                  child: CircleAvatar(
                      radius: 6, backgroundColor: Colors.redAccent),
                ),
                Positioned(
                  right: 40,
                  bottom: 0,
                  child:
                      CircleAvatar(radius: 6, backgroundColor: Colors.purple),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySelector extends StatefulWidget {
  final Function(String) onCategorySelected;

  const CategorySelector({super.key, required this.onCategorySelected});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final List<String> categories = [
    'All',
    'Roads',
    'Parks',
    'Safety',
    'Utilities'
  ];
  String selected = 'All';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selected == category;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (_) {
                setState(() {
                  selected = category;
                });
                widget.onCategorySelected(category);
              },
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
              selectedColor: const Color(0xFF246BFD),
              backgroundColor: Colors.white,
              side: BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecentReportsHeader extends StatelessWidget {
  const RecentReportsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Dropdown with location icon
          Row(
            children: [
              const Icon(Icons.location_on_outlined,
                  color: Colors.deepPurple, size: 18),
              const SizedBox(width: 4),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: 'Within 1 mile',
                  icon: const Icon(Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey, size: 18),
                  style: const TextStyle(
                      fontSize: 15, color: Colors.black, height: 1.2),
                  items: ['Within 1 mile', 'Within 5 miles', 'Within 10 miles']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    // Handle change
                  },
                ),
              ),
            ],
          ),

          // Filters and reports count
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Handle filter tap
                },
                child: Row(
                    // children: const [
                    //   Icon(LucideIcons.filter, color: Colors.blue, size: 18),
                    //   SizedBox(width: 4),
                    //   Text(
                    //     'Filters',
                    //     style: TextStyle(
                    //       color: Colors.blue,
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    // ],
                    ),
              ),
              const SizedBox(width: 16),
              const Text(
                'View All',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RecentReports extends StatelessWidget {
  final List<Map<String, dynamic>> reports = [
    {
      'image':
          'https://www.transpoco.com/hs-fs/hubfs/the_pothole_problem_1%2C000%2C000%20reports%20every%20year%20(one%20every%20two%20minutes).png?width=960&name=the_pothole_problem_1%2C000%2C000%20reports%20every%20year%20(one%20every%20two%20minutes).png',
      'title': 'Large pothole on Main St',
      'description': 'Dangerous pothole causing traffic issues',
      'distance': '0.3 miles away',
      'time': '2 hours ago',
      'severity': 'High',
      'severityColor': Colors.red,
    },
    {
      'image':
          'https://i2-prod.kentlive.news/incoming/article8398468.ece/ALTERNATES/s810/0_Faulty-streetlights.jpg',
      'title': 'Broken streetlight',
      'description': 'Street light not working for 3 days',
      'distance': '0.7 miles away',
      'time': '5 hours ago',
      'severity': 'Medium',
      'severityColor': Colors.orange,
    },
    {
      'image':
          'https://c7.alamy.com/comp/F6NWMJ/overflowing-garbage-can-in-brooklyn-ny-F6NWMJ.jpg',
      'title': 'Overflowing trash bins',
      'description': 'Multiple bins need collection',
      'distance': '1.2 miles away',
      'time': '1 day ago',
      'severity': 'Resolved',
      'severityColor': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Recent Reports',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          itemCount: reports.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final report = reports[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Card(
                color: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        report['image'],
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            report['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            report['description'],
                            style: const TextStyle(color: Colors.black87),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(report['distance']),
                              Text(report['time']),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: (report['severityColor'] as Color)
                                      .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  report['severity'],
                                  style: TextStyle(
                                    color: report['severityColor'],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
