import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychc/controllers/auth_controller.dart';
import 'package:mychc/models/user_model.dart';
import 'package:mychc/screens/loginPage.dart';
import 'package:mychc/widgets/my_button.dart';

class Registerpage extends ConsumerStatefulWidget {
  const Registerpage({super.key});

  @override
  ConsumerState<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends ConsumerState<Registerpage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Clear any previous state when page loads
    Future.microtask(() {
      final notifier = ref.read(authControllerProvider.notifier);
      if (notifier.state is AsyncError) {
        notifier.state = const AsyncValue.data(null);
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    // Listen for state changes
    ref.listen<AsyncValue<User?>>(authControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (user) {
          if (user != null && user.id != 0) {
            // Successful registration - navigate to home
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, '/nav');
            });
          }
        },
        error: (error, stackTrace) {
          // Show error message
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.toString()),
                duration: Duration(seconds: 3),
              ),
            );
          });
        },
      );
    });

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset('assets/images/mychc_no_bg.png'),
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
                "Create account",
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Name
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: "Name",
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          if (value.length > 100) {
                            return 'Name must not exceed 100 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      //email
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          final emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          );
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email address';
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
                      //Confirm password
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      //button
                      authState.isLoading
                          ? CircularProgressIndicator()
                          : Custombutton(
                              buttonText: "Register",
                              action: () {
                                if (_formKey.currentState!.validate()) {
                                  ref
                                      .read(authControllerProvider.notifier)
                                      .register(
                                        _nameController.text.trim(),
                                        _emailController.text.trim(),
                                        _passwordController.text.trim(),
                                        _confirmPasswordController.text.trim(),
                                      );
                                }
                              },
                            ),
                      SizedBox(height: 20),
                      //lower text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have an account?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Loginpage(),
                                ),
                              );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      const Image(
                        image: AssetImage('assets/images/mychc_no_bg.png'),
                        height: 30.0,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mychc/controllers/auth_controller.dart';
// import 'package:mychc/models/user_model.dart';
// import 'package:mychc/screens/loginPage.dart';
// import 'package:mychc/widgets/my_button.dart';

// class Registerpage extends ConsumerStatefulWidget {
//   const Registerpage({super.key});

//   @override
//   ConsumerState<Registerpage> createState() => _RegisterpageState();
// }

// class _RegisterpageState extends ConsumerState<Registerpage> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authState = ref.watch(authControllerProvider);

//     ref.listen<AsyncValue<User?>>(authControllerProvider, (previous, next) {
//       next.whenOrNull(
//         data: (user) {
//           if (user != null) {
//             Navigator.pushReplacementNamed(context, '/nav');
//           }
//         },
//         error: (error, stackTrace) {
//           ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(SnackBar(content: Text(error.toString())));
//         },
//       );
//     });

//     return Scaffold(
//       body: Container(
//         child: Stack(
//           children: [
//             Image.asset('assets/images/mychc_no_bg.png'),
//             // upper container.......................................
//             Container(
//               padding: EdgeInsets.only(top: 50.0, left: 20.0),
//               height: MediaQuery.of(context).size.height / 2,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.orange,
//                     const Color.fromARGB(255, 226, 184, 59),
//                     const Color.fromARGB(255, 185, 147, 31),
//                   ],
//                 ),
//               ),
//               child: Text(
//                 "Create account",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 26.0,
//                   fontWeight: FontWeight.w700,
//                   fontFamily: "Inspiration",
//                 ),
//               ),
//             ),

//             // lower container
//             Container(
//               padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
//               margin: EdgeInsets.only(
//                 top: MediaQuery.of(context).size.height / 4,
//               ),
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     //Name
//                     TextFormField(
//                       controller: _nameController,
//                       decoration: InputDecoration(
//                         hintText: "Name",
//                         prefixIcon: Icon(Icons.person),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your name';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     //email
//                     TextFormField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         hintText: "Email",
//                         prefixIcon: Icon(Icons.email),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         if (!value.contains('@')) {
//                           return 'Please enter a valid email';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     //password
//                     TextFormField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         hintText: "Password",
//                         prefixIcon: Icon(Icons.lock),
//                       ),
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your password';
//                         }
//                         if (value.length < 6) {
//                           return 'Password must be at least 6 characters';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     //Confirm password
//                     TextFormField(
//                       controller: _confirmPasswordController,
//                       decoration: InputDecoration(
//                         hintText: "Confirm Password",
//                         prefixIcon: Icon(Icons.lock),
//                       ),
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please confirm your password';
//                         }
//                         if (value != _passwordController.text) {
//                           return 'Passwords do not match';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     //button
//                     authState.isLoading
//                         ? CircularProgressIndicator()
//                         : Custombutton(
//                             buttonText: "Register",
//                             action: () {
//                               if (_formKey.currentState!.validate()) {
//                                 ref
//                                     .read(authControllerProvider.notifier)
//                                     .register(
//                                       _nameController.text.trim(),
//                                       _emailController.text.trim(),
//                                       _passwordController.text.trim(),
//                                       _confirmPasswordController.text.trim(),
//                                     );
//                               }
//                             },
//                           ),
//                     SizedBox(height: 10),
//                     //lower text
//                     Text(
//                       "Have an account?",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 12.0,
//                         fontWeight: FontWeight.w900,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () => {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Loginpage()),
//                         ),
//                       },
//                       child: Text(
//                         "Login",
//                         style: TextStyle(
//                           color: Colors.orange,
//                           fontSize: 12.0,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     const Image(
//                       image: AssetImage('assets/images/mychc_no_bg.png'),
//                       height: 30.0,
//                       fit: BoxFit.fill,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
