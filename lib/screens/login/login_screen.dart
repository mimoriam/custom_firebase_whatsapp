import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../constants/constants.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:

/// State:

/// Utils/Helpers:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Entry Point:
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kAppBarColor),
        title: Text("Login"),
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
                                labelStyle: TextStyle(),
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
                                labelStyle: TextStyle(),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                GoRouter.of(context).go('/home');
                              },
                              child: Text("Sign In"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                GoRouter.of(context).push('/register');
                              },
                              child: Text("Register"),
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
