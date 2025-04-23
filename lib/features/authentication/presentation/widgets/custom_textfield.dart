import 'package:flutter/material.dart';
import 'package:osnv/core/const/colors.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.onTab,
    this.readonly = false,
  });

  final TextEditingController controller;
  final VoidCallback? onTab;
  final bool obscureText;
  final String hintText;
  final String? labelText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool readonly;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool isActive = false;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isActive = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            focusNode: focusNode,
            controller: widget.controller,
            obscureText: widget.obscureText,
            onTap: widget.onTab,
            readOnly: widget.readonly,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
              // enabled: true,
              focusColor: Colors.blueAccent,
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon,
              labelText: widget.labelText,
              prefixIcon: widget.prefixIcon,
              filled: true,
              fillColor:
                  isActive
                      ? AppColors.trasperentblue
                      : AppColors.textfiledcolor,
            ),
          ),
        ),
      ],
    );
  }
}
