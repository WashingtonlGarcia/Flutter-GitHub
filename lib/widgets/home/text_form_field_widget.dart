import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final void Function(String) onFieldSubmmitted;
  final String Function(String) validator;
  final String hintText;

  TextFormFieldWidget({
    @required this.onFieldSubmmitted,
    @required this.validator,
    @required this.hintText,
  });

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              validator: (String value) {
                if (value.trim().isEmpty) return 'Campo obrigatorio';
                return null;
              },
              onFieldSubmitted: (String value) {
                if (_keyForm.currentState.validate()) {
                  onFieldSubmmitted(value);
                }
              },
              decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.all(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
