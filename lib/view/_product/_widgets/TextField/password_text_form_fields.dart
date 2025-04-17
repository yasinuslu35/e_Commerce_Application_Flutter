import 'package:e_commerce_application/core/extension/context_extension.dart';
import 'package:e_commerce_application/view/_product/_widgets/TextField/text_form_field_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PasswordTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String labelText;


  const PasswordTextFormField({
    super.key,
    this.controller,
    this.validator,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    TextFormFieldViewModel viewModel = TextFormFieldViewModel();
    return Observer(
      builder: (context) => TextFormField(
        obscureText: viewModel.isPasswordVisible,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          fillColor: context.myColors.textFieldBackground,
          filled: true,
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: InkWell(
            onTap: () {
              viewModel.changePasswordVisibility();
            },
            child: Observer(
              builder: (context) => Icon(
                viewModel.isPasswordVisible
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
