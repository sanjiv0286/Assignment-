import 'package:assignment/presentation/controller/language_controller.dart';
import 'package:assignment/presentation/pages/add_language_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountLanguageScreen extends StatelessWidget {
  final LanguageController controller = Get.find();

  AccountLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Padding(
          // padding: const EdgeInsets.all(8.0),
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
          child: Text(
            'Account Language',
            style: TextStyle(
              fontFamily: 'Jost',
              // fontSize: 24,
              fontSize: MediaQuery.of(context).size.width * 0.06,
              fontWeight: FontWeight.w400,
              // height: 1.45,
              height: MediaQuery.of(context).size.height * 0.0018,
              color: Colors.white.withOpacity(0.9),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        // padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width *
              0.04, // Responsive horizontal padding
          vertical: MediaQuery.of(context).size.height *
              0.03, // Responsive vertical padding
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(
                    //   '${controller.selectedLanguages.length} Languages Added',
                    //   style: TextStyle(color: Colors.grey[400], fontSize: 16),
                    // ),
                    Text(
                      '${controller.selectedLanguages.length} Languages Added',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: MediaQuery.of(context).size.width *
                            0.04, // Responsive font size
                      ),
                    ),
                    SizedBox(
                      // width: 85.46,
                      // height: 26,
                      width: MediaQuery.of(context).size.width * 0.28,
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          // textStyle: const TextStyle(
                          //   fontSize: 14,
                          //   fontWeight: FontWeight.w500,
                          // ),
                          textStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width *
                                0.035, // Adjust font size based on screen width
                            fontWeight: FontWeight.w500,
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const AddLanguageDialog(),
                          );
                        },
                        child: const Text('Add Language'),
                      ),
                    ),
                  ],
                )),
            // const SizedBox(height: 24),
            const Spacer(
              flex: 1,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2E2E2E),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                // padding: const EdgeInsets.all(16.0),
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LANGUAGES',
                      style: TextStyle(
                        color: const Color(0xFFBD243A),
                        // fontSize: 15,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Blinker',
                      ),
                    ),
                    // const SizedBox(height: 12),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Obx(() => Wrap(
                          // spacing: 12.0,
                          // runSpacing: 8.0,
                          spacing: MediaQuery.of(context).size.width * 0.03,
                          runSpacing: MediaQuery.of(context).size.height * 0.01,
                          children: controller.selectedLanguages
                              .map((language) =>
                                  _buildLanguageChip(language, context))
                              .toList(),
                        )),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 19,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageChip(String language, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        // horizontal: 16.0,
        // vertical: 8.0,
        horizontal: MediaQuery.of(context).size.width * 0.04,
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF202020),
        // borderRadius: BorderRadius.circular(4),
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * 0.01), // Responsive radius
      ),
      child: Text(
        language,
        style: TextStyle(
          color: Colors.white,
          // fontSize: 10,
          fontSize: MediaQuery.of(context).size.width * 0.03,
          fontWeight: FontWeight.w700,
          fontFamily: 'Blinker',
        ),
      ),
    );
  }
}
