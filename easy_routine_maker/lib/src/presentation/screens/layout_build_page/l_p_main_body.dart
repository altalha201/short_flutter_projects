import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../providers/layout_screen_provider.dart';

class LPMainBody extends StatelessWidget {
  const LPMainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return Consumer<LayoutScreenProvider>(
      builder: (BuildContext context, uiProvider, Widget? child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Create your table layout",
            textAlign: TextAlign.left,
            style: GoogleFonts.merienda(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            controller: uiProvider.titleET,
            decoration: const InputDecoration(
              hintText: "Title for the table",
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: uiProvider.subtitleET,
            decoration: const InputDecoration(
              hintText: "Subtitle for the table",
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: uiProvider.noticeBeforeET,
            decoration: const InputDecoration(
              hintText: "Text before table",
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: uiProvider.noticeAfterET,
            decoration: const InputDecoration(
              hintText: "Text after table",
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: uiProvider.periodCountET,
            decoration: const InputDecoration(
              hintText: "How many periods for a day including break",
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () => uiProvider.goNext(context),
              child: const Text("Next"),
            ),
          )
        ],
      ),
    );
  }
}
