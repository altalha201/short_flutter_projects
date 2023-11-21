import 'package:easy_routine_maker/src/helpers/material_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/background/background_style.dart';
import '../layout_build_page/layout_page_builder.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void _pushToMakeRoutine(BuildContext context) {
    MaterialRouter.push(context, const LayoutPageBuilder());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundStyle(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome To Easy Routine Maker",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.merienda(
                                fontSize: 48,
                                color: Colors.blue.shade700,
                              ),
                            ),
                            const Text("Make your routine easily"),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () => _pushToMakeRoutine(context),
                              child: const Text("Start Making"),
                            ),
                          ],
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
    );
  }
}
