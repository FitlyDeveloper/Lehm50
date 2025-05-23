import 'package:flutter/material.dart';

class FoodCardOpen extends StatefulWidget {
  const FoodCardOpen({super.key});

  @override
  State<FoodCardOpen> createState() => _FoodCardOpenState();
}

class _FoodCardOpenState extends State<FoodCardOpen> {
  bool _isLoading = false;
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with overlay controls
                Container(
                  height: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      // Square gray image
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        color: Color(0xFFDADADA),
                        child: Center(
                          child: Image.asset(
                            'assets/images/meal1.png',
                            width: 48,
                            height: 48,
                          ),
                        ),
                      ),
                      // Top bar overlay (now fixed in the Stack)
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 16,
                        left: 29,
                        right: 29,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.black, size: 24),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Image.asset(
                                    'assets/images/share.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  onPressed: () {},
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                ),
                                IconButton(
                                  icon: Image.asset(
                                    'assets/images/more.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  onPressed: () {},
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Content with gradient background
          SingleChildScrollView(
            child: Column(
              children: [
                // Spacer to push content down
                SizedBox(
                    height: MediaQuery.of(context).size.width *
                        0.8), // Changed from 0.7 to 0.8

                // White rounded container with gradient
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.4, 1],
                      colors: [
                        Color(0xFFFFFFFF),
                        Color(0xFFFFFFFF),
                        Color(0xFFEBEBEB),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      // Time and interaction buttons
                      Padding(
                        padding: const EdgeInsets.fromLTRB(29, 20, 29, 0),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F2F2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '12:07',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                IconButton(
                                  icon: AnimatedSwitcher(
                                    duration: Duration(milliseconds: 300),
                                    transitionBuilder: (Widget child,
                                        Animation<double> animation) {
                                      return ScaleTransition(
                                          scale: animation, child: child);
                                    },
                                    child: _isLiked
                                        ? Icon(Icons.favorite,
                                            color: Colors.black,
                                            key: ValueKey('liked'))
                                        : Image.asset(
                                            'assets/images/like.png',
                                            width: 24,
                                            height: 24,
                                            key: ValueKey('unliked'),
                                          ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isLiked = !_isLiked;
                                    });
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                ),
                                Text('2', style: TextStyle(fontSize: 16)),
                                IconButton(
                                  icon: Image.asset(
                                    'assets/images/comment.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  onPressed: () {},
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                ),
                                Text('2', style: TextStyle(fontSize: 16)),
                                IconButton(
                                  icon: Image.asset(
                                    'assets/images/share.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  onPressed: () {},
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Rest of the content
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Add more vertical spacing
                          SizedBox(height: 20),

                          // Title and description
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 29),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delicious Cake',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'SF Pro Display',
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Rusty Pelican is so good',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Add more vertical spacing
                          SizedBox(height: 20),

                          // Calories and macros card
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 29),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Calories circle
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      // Circle image instead of custom painted progress
                                      Transform.translate(
                                        offset: Offset(0, -3.9),
                                        child: ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                            Colors.black,
                                            BlendMode.srcIn,
                                          ),
                                          child: Image.asset(
                                            'assets/images/circle.png',
                                            width: 130,
                                            height: 130,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      // Calories text
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '500',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          Text(
                                            'Calories',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),

                                  // Macros
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      _buildMacro(
                                          'Protein', '30g', Color(0xFFD7C1FF)),
                                      _buildMacro(
                                          'Fat', '32g', Color(0xFFFFD8B1)),
                                      _buildMacro(
                                          'Carbs', '125g', Color(0xFFB1EFD8)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 20),

                          // Health Score
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 29),
                            child: Row(
                              children: [
                                Icon(Icons.favorite_border,
                                    color: Color(0xFFFF4081)),
                                SizedBox(width: 8),
                                Text(
                                  'Health Score',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Spacer(),
                                Text(
                                  '8/10',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),

                          // Ingredients
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 29),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ingredients',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'SF Pro Display',
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildIngredient(
                                        'Cheesecake', '100g', '300 kcal'),
                                    _buildIngredient(
                                        'Berries', '20g', '10 kcal'),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildIngredient('Jam', '10g', '20 kcal'),
                                    Container(
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  78) /
                                              2,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.05),
                                            blurRadius: 10,
                                            offset: Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 12,
                                            left: 0,
                                            right: 0,
                                            child: Text(
                                              'Add',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'SF Pro Display',
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Center(
                                            child: Image.asset(
                                              'assets/images/add.png',
                                              width: 26.4,
                                              height: 26.4,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          // More options
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 29),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'More',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'SF Pro Display',
                                  ),
                                ),
                                SizedBox(height: 16),
                                _buildMoreOption('In-Depth Nutrition',
                                    Icons.analytics_outlined),
                                _buildMoreOption(
                                    'Fix Manually', Icons.edit_outlined),
                                _buildMoreOption(
                                    'Fix with AI', Icons.auto_awesome_outlined),
                              ],
                            ),
                          ),

                          // Add extra padding at the bottom for the button
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // White box at bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: MediaQuery.of(context).size.height * 0.148887,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),

          // Save button
          Positioned(
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).size.height * 0.06,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.0689,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(28),
              ),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    fontFamily: '.SF Pro Display',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMacro(String name, String amount, Color color) {
    return Column(
      children: [
        Text(name, style: TextStyle(fontSize: 12)),
        SizedBox(height: 4),
        Container(
          width: 80,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            widthFactor: 1.0, // Changed from 0.5 to 1.0 to fill entirely
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(amount,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildIngredient(String name, String amount, String calories) {
    final boxWidth = (MediaQuery.of(context).size.width - 78) / 2;
    return Container(
      width: boxWidth,
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF Pro Display',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                calories,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMoreOption(String title, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
