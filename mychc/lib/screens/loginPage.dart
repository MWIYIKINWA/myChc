import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychc/controllers/auth_controller.dart';
import 'package:mychc/models/user_model.dart';
import 'package:mychc/screens/RegisterPage.dart';
import 'package:mychc/widgets/my_button.dart';

class Loginpage extends ConsumerStatefulWidget {
  const Loginpage({super.key});

  @override
  ConsumerState<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends ConsumerState<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    // ref.listen<AsyncValue<User?>>(authControllerProvider, (previous, next) {
    //   next.whenOrNull(
    //     data: (user) {
    //       if (user != null) {
    //         Navigator.pushReplacementNamed(context, '/nav');
    //       }
    //     },
    //     error: (error, stackTrace) {
    //       ScaffoldMessenger.of(
    //         context,
    //       ).showSnackBar(SnackBar(content: Text(error.toString())));
    //     },
    //   );
    // });
    ref.listen<AsyncValue<User?>>(authControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (user) {
          if (user != null) {
            Navigator.pushReplacementNamed(context, '/nav');
          }
        },
        error: (error, stackTrace) {
          // Error message is now clean without "Exception: " prefix
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error.toString())));
        },
      );
    });

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            const Image(
              image: AssetImage('assets/images/mychc.png'),
              height: 50.0,
              fit: BoxFit.fill,
            ),
            // upper container.......................................
            Container(
              padding: EdgeInsets.only(top: 50.0, left: 20.0),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orange,
                    const Color.fromARGB(255, 226, 184, 59),
                    const Color.fromARGB(255, 185, 147, 31),
                  ],
                ),
              ),
              child: Text(
                "Please Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Inspiration",
                ),
              ),
            ),

            // lower container
            Container(
              padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 4,
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //email
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    //password
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    //button
                    authState.isLoading
                        ? CircularProgressIndicator()
                        : Custombutton(
                            buttonText: "Login",
                            action: () {
                              if (_formKey.currentState!.validate()) {
                                ref
                                    .read(authControllerProvider.notifier)
                                    .login(
                                      _emailController.text.trim(),
                                      _passwordController.text.trim(),
                                    );
                              }
                            },
                          ),
                    SizedBox(height: 30),
                    //lower text
                    Text(
                      "Have no account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registerpage(),
                          ),
                        ),
                      },
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    const Image(
                      image: AssetImage('assets/images/mychc_no_bg.png'),
                      height: 30.0,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
