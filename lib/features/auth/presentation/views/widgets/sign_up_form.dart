import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/widgets/custom_button.dart';
import 'package:restaurant/core/widgets/custom_text_field.dart';
import 'package:restaurant/features/auth/presentation/manager/auth_bloc/auth_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool hiddenPassword = true;
  bool hiddenConfirmPassword = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? name, email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 8,
        children: [
          CustomTextField(
            autovalidateMode: autovalidateMode,
            lable: 'Name',
            hint: 'Type your full name',
            icon: Icon(Icons.person),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            onSaved: (value) {
              name = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          CustomTextField(
            autovalidateMode: autovalidateMode,
            lable: 'Email',
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
            controller: passwordController,

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
            isPassword: hiddenPassword,
            textInputAction: TextInputAction.next,
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
          CustomTextField(
            autovalidateMode: autovalidateMode,
            controller: confirmPasswordController,
            lable: 'Password',
            hint: '********',
            icon: Icon(Icons.lock),
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  hiddenConfirmPassword = !hiddenConfirmPassword;
                });
              },
              child: hiddenConfirmPassword
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.remove_red_eye),
            ),
            keyboardType: TextInputType.visiblePassword,
            isPassword: hiddenConfirmPassword,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please confirm your password';
              } else if (value != passwordController.text) {
                return 'passwords do not match';
              }
              return null;
            },
          ),
          CustomButton(
            text: 'sign up',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                BlocProvider.of<AuthBloc>(context).add(
                  RegisterEvent(
                    email: email!,
                    name: name!,
                    password: password!,
                  ),
                );
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
