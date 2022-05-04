import 'package:flutter/material.dart';
import '../../constants/constants.dart';

/// Models:

/// Screens:

/// Widgets:
import 'package:custom_firebase_whatsapp/screens/register/register_screen.dart';

/// Services:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// State:

/// Utils/Helpers:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../services/auth.dart';

/// Entry Point:
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(kAppBarColor),
        title: const Text("Login"),
      ),
      body: SafeArea(
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) {
            return OrientationLayoutBuilder(
              portrait: (BuildContext context) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Builder(builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: FormBuilder(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FormBuilderTextField(
                              name: 'email',
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.email(),
                                FormBuilderValidators.minLength(6),
                              ]),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                labelStyle: const TextStyle(),
                              ),
                            ),
                            FormBuilderTextField(
                              name: 'password',
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.minLength(6),
                              ]),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                labelStyle: const TextStyle(),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                _formKey.currentState?.save();

                                if (_formKey.currentState!.validate()) {
                                  await Auth(auth: _auth).signIn(
                                    email: _formKey.currentState?.fields['email']?.value,
                                    password: _formKey.currentState?.fields['password']?.value,
                                  );

                                  // if (returnValue == "Success") {
                                  //   _formKey.currentState?.reset();
                                  // } else {
                                  //   ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(
                                  //       content: Text(returnValue ?? "Null"),
                                  //     ),
                                  //   );
                                  // }
                                } else {
                                  debugPrint("Validation Failed!");
                                }

                                // GoRouter.of(context).go('/home');
                              },
                              child: const Text("Sign In"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // GoRouter.of(context).push('/register');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                                );
                              },
                              child: const Text("Register"),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await Auth(auth: _auth).signInWithGoogle();
                              },
                              child: const Text("Sign in with Google"),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              landscape: (BuildContext context) => Container(),
            );
          },
          tablet: (BuildContext context) {
            return OrientationLayoutBuilder(
              portrait: (context) => Container(),
              landscape: (context) => Container(),
            );
          },
          desktop: (BuildContext context) => Container(),
        ),
      ),
    );
  }
}
