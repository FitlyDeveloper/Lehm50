import 'package:flutter/material.dart';
import 'package:fitness_app/Features/onboarding/presentation/screens/questions/weight_goal_screen.dart';
import 'package:flutter/rendering.dart';

class WeightHeightScreen extends StatefulWidget {
  const WeightHeightScreen({super.key});

  @override
  State<WeightHeightScreen> createState() => _WeightHeightScreenState();
}

class _WeightHeightScreenState extends State<WeightHeightScreen> {
  static const int totalSteps = 7;
  static const int currentStep = 2;

  // Units
  bool isImperial = true;

  // Weight values
  int selectedWeight = 150;
  List<int> weightOptions = List.generate(100, (index) => 100 + index);

  // Height values (imperial)
  int selectedFeet = 5;
  int selectedInches = 7;
  List<int> feetOptions = List.generate(8, (index) => index + 3); // 3-10 feet
  List<int> inchesOptions = List.generate(12, (index) => index); // 0-11 inches

  double get progress => currentStep / totalSteps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.grey[100]!.withOpacity(0.9),
                ],
              ),
            ),
          ),

          // Main content
          SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button and progress bar
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16, right: 24),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.black, size: 24),
                        onPressed: () => Navigator.pop(context),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 2,
                          backgroundColor: const Color(0xFFE5E5EA),
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),

                // Title and subtitle
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Weight & Height',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          height: 1.21,
                          fontFamily: '.SF Pro Display',
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'This helps us personalize your plan.',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          fontFamily: '.SF Pro Display',
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),

                // Fixed layout container to match iPhone 13 mini proportions
                LayoutBuilder(
                  builder: (context, constraints) {
                    // Get available height after accounting for top elements and bottom area
                    final availableHeight = constraints.maxHeight -
                        150; // Subtract for bottom padding
                    // iPhone 13 mini height: 812 points
                    // Reference height for spacing calculation - the key to consistency
                    const referenceHeight = 812.0;
                    // Scale factor based on device height
                    final scaleFactor =
                        MediaQuery.of(context).size.height / referenceHeight;

                    // Position the toggle at the exact same relative position as on iPhone 13 mini
                    return Container(
                      height: availableHeight,
                      padding: EdgeInsets.zero, // Remove padding from container
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // Center all children
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Create fixed spacing that matches iPhone 13 mini
                          SizedBox(height: 60 * scaleFactor),

                          // Unit toggle - fixed position with guaranteed centering
                          Container(
                            width: double
                                .infinity, // Full width to allow centering
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Imperial',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Switch(
                                  value: !isImperial,
                                  onChanged: (value) {
                                    setState(() {
                                      isImperial = !value;
                                    });
                                  },
                                  activeColor: Colors.black,
                                  inactiveThumbColor: Colors.black,
                                  inactiveTrackColor: Colors.grey[300],
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  'Metric',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Fixed spacing from toggle to labels
                          SizedBox(height: 30 * scaleFactor),

                          // COMBINED LABELS AND PICKERS - GUARANTEED ALIGNMENT
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                children: [
                                  // LEFT SIDE - WEIGHT COLUMN
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Weight label
                                        Text(
                                          'Weight',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        // Fixed spacing - always 20 pixels on all devices
                                        const SizedBox(height: 20),
                                        // Weight picker
                                        Expanded(
                                          child: ClipRect(
                                            child: OverflowBox(
                                              maxHeight: double.infinity,
                                              child: ListWheelScrollView
                                                  .useDelegate(
                                                itemExtent: 45,
                                                perspective: 0.005,
                                                diameterRatio: 1.5,
                                                physics:
                                                    FixedExtentScrollPhysics(),
                                                onSelectedItemChanged: (index) {
                                                  setState(() {
                                                    selectedWeight =
                                                        weightOptions[index];
                                                  });
                                                },
                                                childDelegate:
                                                    ListWheelChildBuilderDelegate(
                                                  childCount:
                                                      weightOptions.length,
                                                  builder: (context, index) {
                                                    final weight =
                                                        weightOptions[index];
                                                    final isSelected = weight ==
                                                        selectedWeight;
                                                    return Center(
                                                      child: Text(
                                                        '$weight lb',
                                                        style: TextStyle(
                                                          fontSize: isSelected
                                                              ? 20
                                                              : 16,
                                                          fontWeight: isSelected
                                                              ? FontWeight.bold
                                                              : FontWeight
                                                                  .normal,
                                                          color: isSelected
                                                              ? Colors.black
                                                              : Colors
                                                                  .grey[400],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // RIGHT SIDE - HEIGHT COLUMN
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Height label
                                        Container(
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Height',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        // Fixed spacing - always 20 pixels on all devices
                                        const SizedBox(height: 20),
                                        // Height pickers
                                        Expanded(
                                          child: Row(
                                            // Use center alignment with fixed spacing between pickers
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // Feet picker
                                              SizedBox(
                                                width: 70,
                                                child: ClipRect(
                                                  child: OverflowBox(
                                                    maxHeight: double.infinity,
                                                    child: ListWheelScrollView
                                                        .useDelegate(
                                                      itemExtent: 45,
                                                      perspective: 0.005,
                                                      diameterRatio: 1.5,
                                                      physics:
                                                          FixedExtentScrollPhysics(),
                                                      onSelectedItemChanged:
                                                          (index) {
                                                        setState(() {
                                                          selectedFeet =
                                                              feetOptions[
                                                                  index];
                                                        });
                                                      },
                                                      childDelegate:
                                                          ListWheelChildBuilderDelegate(
                                                        childCount:
                                                            feetOptions.length,
                                                        builder:
                                                            (context, index) {
                                                          final feet =
                                                              feetOptions[
                                                                  index];
                                                          final isSelected =
                                                              feet ==
                                                                  selectedFeet;
                                                          return Center(
                                                            child: Text(
                                                              '$feet ft',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    isSelected
                                                                        ? 20
                                                                        : 16,
                                                                fontWeight: isSelected
                                                                    ? FontWeight
                                                                        .bold
                                                                    : FontWeight
                                                                        .normal,
                                                                color: isSelected
                                                                    ? Colors
                                                                        .black
                                                                    : Colors.grey[
                                                                        400],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              // Fixed spacing between ft and in pickers
                                              const SizedBox(width: 24),

                                              // Inches picker
                                              SizedBox(
                                                width: 70,
                                                child: ClipRect(
                                                  child: OverflowBox(
                                                    maxHeight: double.infinity,
                                                    child: ListWheelScrollView
                                                        .useDelegate(
                                                      itemExtent: 45,
                                                      perspective: 0.005,
                                                      diameterRatio: 1.5,
                                                      physics:
                                                          FixedExtentScrollPhysics(),
                                                      onSelectedItemChanged:
                                                          (index) {
                                                        setState(() {
                                                          selectedInches =
                                                              inchesOptions[
                                                                  index];
                                                        });
                                                      },
                                                      childDelegate:
                                                          ListWheelChildBuilderDelegate(
                                                        childCount:
                                                            inchesOptions
                                                                .length,
                                                        builder:
                                                            (context, index) {
                                                          final inches =
                                                              inchesOptions[
                                                                  index];
                                                          final isSelected =
                                                              inches ==
                                                                  selectedInches;
                                                          return Center(
                                                            child: Text(
                                                              '$inches in',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    isSelected
                                                                        ? 20
                                                                        : 16,
                                                                fontWeight: isSelected
                                                                    ? FontWeight
                                                                        .bold
                                                                    : FontWeight
                                                                        .normal,
                                                                color: isSelected
                                                                    ? Colors
                                                                        .black
                                                                    : Colors.grey[
                                                                        400],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
                          ),
                        ],
                      ),
                    );
                  },
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

          // Next button
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WeightGoalScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Continue',
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
}
