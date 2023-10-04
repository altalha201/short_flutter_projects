import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordDialog extends StatefulWidget {
  const PasswordDialog({
    super.key,
    required this.siteName,
    required this.pass,
    required this.loginInfo,
  });

  final String siteName, pass, loginInfo;

  @override
  State<PasswordDialog> createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog> {
  bool _show = false;

  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.pass);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Be careful!"),
      content: _buildContent(),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              _show = !_show;
            });
          },
          child: Text(_show ? "Hide Password" : "Show Password"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Ok"),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            "Your Password for the site ${widget.siteName} with the account ${widget.loginInfo} is:",
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          obscureText: !_show,
          controller: _controller,
          readOnly: true,
          style: GoogleFonts.croissantOne(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            contentPadding: EdgeInsets.zero,
          ),
        )
      ],
    );
  }
}
