import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_form.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      "Add a new account",
                      style: GoogleFonts.croissantOne(fontSize: 28),
                    ),
                    const SizedBox(height: 16.0),
                    const AddForm(),
                  ],
                ),
              ),
            ),
            const Positioned(
              top: 16,
              left: 16,
              child: BackButton(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
