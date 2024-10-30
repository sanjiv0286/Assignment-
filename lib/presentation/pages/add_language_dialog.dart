import 'package:assignment/presentation/controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddLanguageDialog extends StatelessWidget {
  const AddLanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController controller = Get.find();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipPath(
        clipper: CustomDialogClipper(),
        child: Container(
          width: screenWidth * 0.95,
          decoration: BoxDecoration(
            // color: const Color(0xFF0E181B),
            color: Colors.white,
            // borderRadius: BorderRadius.circular(16),
            borderRadius: BorderRadius.circular(
                screenWidth * 0.04), // dynamic border radius
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // *Custom Header with Red Background and Cut Shape
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: screenHeight * 0.06, // 10% of the screen height
                    width: screenWidth * 0.95,
                    decoration: const BoxDecoration(
                      // color: Color(0xFF0E181B),
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: ClipPath(
                      clipper: CustomHeaderClipper(),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          // vertical: 14,
                          vertical: screenHeight * 0.020,
                          horizontal: screenWidth * 0.15,
                        ),
                        color: const Color(0xFFDE2234),
                        child: Text(
                          'ADD LANGUAGE',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            // fontSize: 14,
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 16),
              SizedBox(height: screenHeight * 0.02), // dynamic spacing
              // *anguage Buttons Grid
              Padding(
                // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),

                child: SingleChildScrollView(
                  child: Padding(
                    // padding: const EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: Wrap(
                      // spacing: 8,
                      // runSpacing: 8,
                      spacing: screenWidth * 0.03,
                      runSpacing: screenHeight * 0.015,
                      children:
                          controller.getAvailableLanguages().map((language) {
                        return Obx(() => _buildLanguageButton(
                              language,
                              isSelected: controller.selectedLanguages.contains(
                                language,
                              ),
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                            ));
                      }).toList(),
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 24),
              SizedBox(height: screenHeight * 0.03), // dynamic spacing
              // *Action Buttons
              Padding(
                // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Row(
                  children: [
                    Expanded(
                      child: ClipPath(
                        clipper: LeftBottomCornerClipper(),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: const Color(0xFFC5D1D8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            side:
                                const BorderSide(color: Colors.black, width: 2),
                            // padding: const EdgeInsets.symmetric(vertical: 12),
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.015),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                              fontFamily: 'Jost',
                              // fontSize: 12,
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(width: 8),
                    SizedBox(width: screenWidth * 0.02), // dynamic spacing
                    // *Save button with dynamic color and activation
                    Expanded(
                      child: Obx(() {
                        final bool hasSelectedLanguage =
                            controller.selectedLanguages.isNotEmpty;
                        return ClipPath(
                          clipper: RightBottomCornerClipper(),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: hasSelectedLanguage
                                  ? const Color(0xFFDE2234)
                                  : const Color(0xFF3F3F3F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              side: const BorderSide(
                                  color: Colors.black, width: 2),
                              // padding: const EdgeInsets.symmetric(vertical: 12),
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.015),
                            ),
                            onPressed: hasSelectedLanguage
                                ? () {
                                    Navigator.of(context).pop();
                                  }
                                : null,
                            child: Text(
                              'SAVE',
                              style: TextStyle(
                                fontFamily: 'Jost',
                                // fontSize: 12,
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 16),
              SizedBox(height: screenHeight * 0.02), // dynamic spacing
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageButton(
    String language, {
    bool isSelected = false,
    required double screenWidth,
    required double screenHeight,
  }) {
    return SizedBox(
      // width: 100,
      // height: 40,
      width: screenWidth * 0.30, // dynamic width
      height: screenHeight * 0.05, // dynamic height
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? const Color(0xFFDE2234) : const Color(0xFF3F3F3F),
          foregroundColor: Colors.white,
          textStyle: TextStyle(
            fontFamily: 'Jost',
            // fontSize: 12,
            fontSize: screenWidth * 0.03,
            fontWeight: FontWeight.w400,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
        ),
        onPressed: () {
          final LanguageController controller = Get.find();
          controller.toggleLanguageSelection(language);
        },
        child: Text(
          language,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
          ), // Adjusting font size based on screen width
        ),
      ),
    );
  }
}

// *Custom clipper classes remain unchanged

class LeftBottomCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.lineTo(20, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class RightBottomCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomDialogClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(20, 0);
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, 20);
    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(20, size.height);
    path.lineTo(0, size.height - 20);
    path.lineTo(0, 20);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.85, size.height * 0.85);
    path.lineTo(size.width * 0.15, size.height * 0.85);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
