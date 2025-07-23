import 'package:flutter/material.dart';

import 'package:restaurant/core/widgets/custom_button.dart';
import 'package:restaurant/core/widgets/custom_text_field.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  bool hiddenPassword = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            autovalidateMode: autovalidateMode,
            lable: 'email',
            hint: 'mail@example.com',
            icon: Icon(Icons.email_outlined),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onSaved: (value) {
              email = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!value.contains('@') || !value.contains('.')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          CustomTextField(
            autovalidateMode: autovalidateMode,
            lable: 'Password',
            hint: '********',
            icon: Icon(Icons.lock),
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  hiddenPassword = !hiddenPassword;
                });
              },
              child: hiddenPassword
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.remove_red_eye),
            ),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            isPassword: hiddenPassword,
            onSaved: (value) {
              password = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 8) {
                return 'password must be at least 8 characters';
              }
              return null;
            },
          ),

          const SizedBox(height: 25),
          CustomButton(
            text: 'log in',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
