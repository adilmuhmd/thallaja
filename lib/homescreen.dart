import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> services = [
    {'title': 'Maintenance', 'badge': '30 MIN'},
    {'title': 'Spares'},
    {'title': 'Projects'},
    {'title': 'Rentals'},
    {'title': 'AMC', 'badge': '25% OFF'},
  ];

  final List<String> _iconPaths = [
    'icons/home.svg',
    'icons/ecommerce.svg',
    'icons/order.svg',
    'icons/profile.svg',
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final itemWidth = (screenWidth - 80) / 3; 


    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'icons/home.svg',
              width: 24,
              height: 24,
              color: _selectedIndex == 0 ? Colors.black : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'icons/ecommerce.svg',
              width: 24,
              height: 24,
              color: _selectedIndex == 1 ? Colors.black : Colors.grey,
            ),
            label: 'E-Store',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'icons/order.svg',
              width: 24,
              height: 24,
              color: _selectedIndex == 2 ? Colors.black : Colors.grey,
            ),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'icons/profile.svg',
              width: 24,
              height: 24,
              color: _selectedIndex == 3 ? Colors.black : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),

      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 250, // height of the image area at top
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  floating: true,
                  pinned: true,
                  surfaceTintColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  expandedHeight: 200,
                  collapsedHeight: 140,
                  flexibleSpace: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      final double top = constraints.biggest.height;
                      final bool isCollapsed = top <= kToolbarHeight + MediaQuery.of(context).padding.top;

                      return Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              'assets/background.png', // 🖼️ your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                height: top - MediaQuery.of(context).padding.top, // ensure no overflow
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      // Home title + location
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Home",
                                                  style: TextStyle(
                                                    fontSize: isCollapsed ? 18 : 22,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "Rubik",
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(Icons.location_on_outlined, color: Color(0xFF4A5568), size: 16),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      "Al Barsha, Dubai",
                                                      style: TextStyle(
                                                        fontSize: isCollapsed ? 12 : 14,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: "Rubik",
                                                        color: const Color(0xFF4A5568),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            'icons/Notification.svg',
                                            width: isCollapsed ? 40 : 60,
                                            height: isCollapsed ? 40 : 60,
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            width: isCollapsed ? 40 : 50,
                                            height: isCollapsed ? 40 : 50,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(color: Colors.grey.shade300),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 6,
                                                  offset: const Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            child: SvgPicture.asset(
                                              'icons/Cart.svg',
                                              width: 25,
                                              height: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),

                                      // Search Bar
                                      Material(
                                        elevation: 4,
                                        shadowColor: Colors.black.withOpacity(0.12),
                                        borderRadius: BorderRadius.circular(12),
                                        child: GestureDetector(
                                          onTap: () {
                                            showGeneralDialog(
                                              context: context,
                                              barrierDismissible: true,
                                              barrierLabel: "Search",
                                              pageBuilder: (context, animation, secondaryAnimation) => const SizedBox(),
                                              transitionBuilder: (context, animation, secondaryAnimation, child) {
                                                return FadeTransition(
                                                  opacity: animation,
                                                  child: ScaleTransition(
                                                    scale: animation,
                                                    child: _FullScreenSearchBar(),
                                                  ),
                                                );
                                              },
                                              transitionDuration: const Duration(milliseconds: 300),
                                            );
                                          },
                                          child: AbsorbPointer(
                                            child: SizedBox(
                                              height: isCollapsed ? 45 : 60,
                                              width: double.infinity,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  hintText: "Search services, rentals, or products",
                                                  hintStyle: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Rubik",
                                                  ),
                                                  prefixIcon: Padding(
                                                    padding: const EdgeInsets.all(12.0),
                                                    child: SvgPicture.asset(
                                                      'icons/search.svg',
                                                      width: 20,
                                                      height: 20,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(height: 22,),
                      const Text(
                        "Explore our services",
                        style: TextStyle(fontSize: 16,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 24),


            Wrap(
            spacing: 20,
            runSpacing: 20,
            children: services.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> service = entry.value;
              String imagePath = index == 0
                  ? 'assets/Card Image.png'
                  : 'assets/Card Image ($index).png';

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: SpringyServiceCard(
                  onTap: () {
                    print('Tapped on ${service['title']}');
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: itemWidth,
                        height: 136,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F6F7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Center(
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                service['title'] ?? '',
                                style: const TextStyle(
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (service.containsKey('badge'))
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: service['badge']!.contains('%') ? Colors.green : Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              service['badge']!,
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 34),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Active service request",
                            style: TextStyle(
                              fontFamily: "Rubik",
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F6F7),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child:  Text(
                              "See more",
                              style: TextStyle(
                                fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF4A5568)),
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: 25.5),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Image.asset(
                                    'assets/Cold Storge.png',
                                    fit: BoxFit.cover, // or BoxFit.contain if you want to keep aspect ratio without cropping
                                  ),
                                ),

                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("Cold Storage", style: TextStyle(
                                        color: Color(0xFF232831),
                                          fontSize: 16,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.w500)),
                                      const Text("Imperial systems Pvt. Ltd.",
                                      style: TextStyle(
                                        fontSize:14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Rubik",
                                        color: Color(0xFF4A5568),
                                      ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 21.5,),
                            Container(
                              width: screenWidth*2.1,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F6F7), // light iOS-style background (customizable)
                                borderRadius: BorderRadius.circular(20), // rounded edges
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min, // keeps the container tight around the content
                                children: [
                                  Container(
                                    width: 21,
                                    height: 21,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF0B357D), // Background color
                                      shape: BoxShape.circle,   // Makes it perfectly round
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add_location_rounded,
                                        size: 12,
                                        color: Colors.white, // Icon color
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 15),
                                  const Text(
                                    "Dubai, United Arab Emirates",
                                    style: TextStyle(
                                      fontFamily: "Rubik",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xFF0B357D),
                                    ),
                                  ),
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                      const SizedBox(height: 34),
                      Container(
                        width: 361,
                        height: 206,
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset(
                          'assets/Card Banner.png',
                          fit: BoxFit.contain,
                        ),
                      ),

                      // const SizedBox(height: 24),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FullScreenSearchBar extends StatefulWidget {
  const _FullScreenSearchBar({super.key});

  @override
  State<_FullScreenSearchBar> createState() => _FullScreenSearchBarState();
}

class _FullScreenSearchBarState extends State<_FullScreenSearchBar> {
  final TextEditingController _controller = TextEditingController();
  List<String> recentSearches = [
    'Cold Storages',
    'Reefer Vehicles in Dubai',
    'Projects',
    'Rentals',
  ];

  void _fillSearch(String value) {
    setState(() {
      _controller.text = value;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: value.length),
      );
    });
  }

  void _removeSearch(String value) {
    setState(() {
      recentSearches.remove(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const SizedBox(height: 35),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F6F8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          onSubmitted: (value) {
                            Navigator.pop(context);
                          },
                          autofocus: true,
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Search "cold spare parts"',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6C757D),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                'icons/search.svg',
                                width: 20,
                                height: 20,
                                color: Colors.grey,
                              ),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: const Icon(Icons.close, size: 25, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (recentSearches.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recently searched',
                      style: TextStyle(
                        fontFamily: "Rubik",
                        color: Color(0xFF717171),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => recentSearches.clear()),
                      child: const Text(
                        'Clear',
                        style: TextStyle(
                          color: Color(0xFF717171),
                          fontSize: 16,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 25),
              ...recentSearches.map((item) => _buildRecentSearchItem(item)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentSearchItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => _fillSearch(text),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFF4A5568),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _removeSearch(text),
                child: const Icon(Icons.close, size: 20, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),
           Divider(
             color: Color(0xFF4A5568).withOpacity(0.1), // lighter shade
            thickness: 0.5,
            height: 1,
          ),
        ],
      ),
    );
  }
}

class SpringyServiceCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const SpringyServiceCard({super.key, required this.child, this.onTap});

  @override
  State<SpringyServiceCard> createState() => _SpringyServiceCardState();
}

class _SpringyServiceCardState extends State<SpringyServiceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
      lowerBound: 0.95,
      upperBound: 1.0,
      value: 1.0,
    );
    _scaleAnim = _controller.drive(Tween(begin: 1.0, end: 0.95).chain(CurveTween(curve: Curves.elasticOut)));
  }

  void _onTapDown(TapDownDetails details) {
    _controller.reverse();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.forward();
  }

  void _onTapCancel() {
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnim,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: widget.onTap,
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTapCancel: _onTapCancel,
          splashFactory: InkRipple.splashFactory, // Material ripple effect
          child: widget.child,
        ),
      ),
    );
  }
}
