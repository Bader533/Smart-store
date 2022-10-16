import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required TextEditingController controller,
    required TextInputType textInputType,
    required String hint,
    required IconData iconData,
    required IconData iconDataSuffix,
    required bool obscure,
  })  : _controller = controller,
        _textInputType = textInputType,
        _hint = hint,
        _iconData = iconData,
        _iconDataSuffix = iconDataSuffix,
        _obscure = obscure,
        super(key: key);

  final TextEditingController _controller;
  final TextInputType _textInputType;
  final String _hint;
  final IconData _iconData;
  final IconData _iconDataSuffix;
  final bool _obscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: _textInputType,
      obscureText: _obscure,
      decoration: InputDecoration(
        hintText: _hint,
        prefixIcon: Icon(_iconData),
        suffixIcon: Icon(
          _iconDataSuffix,
          color: const Color(0xFF000000),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
