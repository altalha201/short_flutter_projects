import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../view_model/controllers/data_controller.dart';
import '../../components/loadings/circle_loading.dart';
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
            _buildMainBody(),
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

  Widget _buildMainBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: GetBuilder<DataController>(builder: (controller) {
          if (controller.addingNewData) {
            return const CircleLoading();
          }
          return ListView(
            shrinkWrap: true,
            children: [
              Text(
                "Add a new account",
                style: GoogleFonts.croissantOne(fontSize: 28),
              ),
              const SizedBox(height: 16.0),
              const AddForm(),
            ],
          );
        }),
      ),
    );
  }
}
