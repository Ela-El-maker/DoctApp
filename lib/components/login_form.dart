import 'package:doctapp/components/button.dart';
import 'package:doctapp/utils/config.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: obsecurePass,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              alignLabelWithHint: true,
              prefixIcon: const Icon(
                Icons.lock_outline_rounded,
              ),
              prefixIconColor: Config.primaryColor,
              suffixIcon: IconButton(
                icon: Icon(
                  obsecurePass
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Config.blackColor,
                ),
                onPressed: () {
                  setState(() {
                    obsecurePass = !obsecurePass;
                  });
                },
              ),
            ),
          ),
          Config.spaceSmall,
          Button(
            width: double.infinity,
            title: 'Sign In',
            disable: false,
            onPressed: () {
              Navigator.of(context).pushNamed('main');
            },
          ),
        ],
      ),
    );
  }
}
