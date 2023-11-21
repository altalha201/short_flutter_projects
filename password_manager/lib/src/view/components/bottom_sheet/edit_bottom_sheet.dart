import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../view_model/controllers/data_controller.dart';
import '../loadings/circle_loading.dart';

class EditBottomSheet extends StatefulWidget {
  const EditBottomSheet({
    super.key,
    required this.siteID,
    required this.sitePass,
  });

  final String siteID, sitePass;

  @override
  State<EditBottomSheet> createState() => _EditBottomSheetState();
}

class _EditBottomSheetState extends State<EditBottomSheet> {
  late final TextEditingController _controller;

  bool _showPass = false;

  @override
  void initState() {
    super.initState();
    var t = widget.sitePass;
    var textItem = Get.find<DataController>().getPassword(t);
    _controller = TextEditingController(text: textItem);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
        color: Colors.white,
      ),
      child: GetBuilder<DataController>(
        builder: (dataController) {
          if(dataController.updating) {
            return const CircleLoading();
          }
          return _buildMainBody(context, dataController);
        }
      ),
    );
  }

  Widget _buildMainBody(BuildContext context, DataController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildBar(),
        Text(
          "Edit Password",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16.0),
        _buildTextInput(),
        const SizedBox(height: 16.0),
        _buildButton(controller),
      ],
    );
  }

  Widget _buildButton(DataController controller) {
    return Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () async {
                String newPass = controller.getEncrypt(_controller.text);
                await controller.editPassword(widget.siteID, newPass);
              },
              child: const Text("Update"),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Done"),
            ),
          ),
        ],
      );
  }

  Widget _buildBar() {
    return Container(
      height: 5,
      width: 100,
      margin: const EdgeInsets.only(
        bottom: 20.0,
        // top: 8.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
    );
  }

  Widget _buildTextInput() => TextField(
        controller: _controller,
        obscureText: !_showPass,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _showPass = !_showPass;
              });
            },
            icon: Icon(_showPass ? Icons.visibility_off : Icons.visibility),
          ),
        ),
      );
}
