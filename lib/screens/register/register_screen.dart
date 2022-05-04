import 'package:flutter/material.dart';
import '../../constants/constants.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/auth.dart';

/// State:

/// Utils/Helpers:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

/// Entry Point:
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormBuilderState>();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    // GoRouter.of(context).pop();
    Navigator.pop(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(kAppBarColor),
        title: const Text("Register"),
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
                              name: 'name',
                              keyboardType: TextInputType.text,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.minLength(4),
                              ]),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: "Name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                labelStyle: const TextStyle(),
                              ),
                            ),
                            FormBuilderTextField(
                              name: 'email',
                              keyboardType: TextInputType.emailAddress,
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
                              keyboardType: TextInputType.text,
                              obscureText: !passwordVisible,
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
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                labelStyle: const TextStyle(),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final String? returnValue = await Auth(auth: _auth).createAccount(
                                  displayName: _formKey.currentState?.fields['name']?.value,
                                  email: _formKey.currentState?.fields['email']?.value,
                                  password: _formKey.currentState?.fields['password']?.value,
                                );

                                if (returnValue == "Success") {
                                  _formKey.currentState?.reset();
                                  // GoRouter.of(context).pop();
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(returnValue ?? "Null"),
                                    ),
                                  );
                                }
                              },
                              child: const Text("Create Account"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // GoRouter.of(context).pop();
                                Navigator.pop(context);
                              },
                              child: const Text("Go to Login"),
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
