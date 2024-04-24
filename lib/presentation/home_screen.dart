import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelection = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Gemini",
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: MaterialSegmentedControl(
                  children: const {
                    0: Text('Yesterday'),
                    1: Text('Today'),
                    2: Text('Tomorrow'),
                  },
                  selectionIndex: currentSelection,
                  borderColor: const Color.fromARGB(255, 128, 126, 126),
                  selectedColor: Colors.white,
                  unselectedColor: Colors.white,
                  selectedTextStyle: const TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.w500),
                  unselectedTextStyle: const TextStyle(color: Color.fromARGB(255, 223, 161, 234), fontSize: 20, fontWeight: FontWeight.w500),
                  borderWidth: 1,
                  borderRadius: 6.0,
                  onSegmentTapped: (index) {
                    setState(() {
                      currentSelection = index;
                    });
                  },
                ),
              ),
              Expanded(
                child: IndexedStack(
                  index: currentSelection,
                  children: [
                    buildParagraph(
                      "Flutter is an open source framework developed and supported by Google. Frontend and full-stack developers use Flutter to build an application’s user interface (UI) for multiple platforms with a single codebase.",
                    ),
                    buildParagraph(
                      "Flutter uses the open-source programming language Dart, which was also developed by Google. Dart is optimized for building UIs, and many of Dart’s strengths are used in Flutter.",
                    ),
                    buildParagraph(
                      "Fast, consistent, and customizable rendering. Instead of relying on platform-specific rendering tools, Flutter uses Google’s open-source Skia graphic library to render UI. This provides users with consistent visuals no matter what platform they use to access an application. ",
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

  Widget buildParagraph(String content) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(
        content,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
