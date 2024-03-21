import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mocsmunchv2/components/loginButton.dart';
import 'package:mocsmunchv2/components/loginTextField.dart';
import 'package:mocsmunchv2/pages/loginPages/userAccountPage.dart';


class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedPasswordController = TextEditingController();

 // sign user up method
void signUserUp() async {
  /* Show loading circle
  showDialog(
    context: context,
    barrierDismissible: false, // User must tap button to dismiss
    builder: (context) {
      return const Center(child: CircularProgressIndicator());
    },
  ); */

  // Try creating the user
  try {
    if (passwordController.text == confirmedPasswordController.text) {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Get the user ID from the created user
      String userId = userCredential.user!.uid;

      // Use the user ID to create a document in the 'users' collection in Firestore
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'email': emailController.text,
        // Add other user info you'd like to store, such as 'name', 'createdAt', etc.
      });

      // Pop the loading circle
      // Navigator.pop(context);

      // Navigate to UserAccountPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserAccountPage()),
      );

    } else {
      // Pop the loading circle
      // Navigator.pop(context);

      // Show error message, passwords don't match
      showErrorMessage("Passwords don't match");
    }
  } on FirebaseAuthException catch (e) {
    // Pop the loading circle
    // Navigator.pop(context);

    // Show error message
    showErrorMessage(e.message ?? "An unknown error occurred");
  }
}



  // Error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
          return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(message,
            style: const TextStyle(color: Colors.white)
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 38, 71, 1.0),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
            
                // logo at the top
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100, // Specify the desired width
                      height: 100, // Specify the desired height
                      child: Image.asset('lib/assets/images/MocsMunchLogo.png'),
                    ),
                  ],
                ),
            
                // Let's create an account for you!
                const Text(
                  'Let\'s get started, Munch!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
            
                const SizedBox(height: 25),
            
                // Email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
            
                const SizedBox(height: 10),
            
                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
            
                const SizedBox(height: 10),

                // confirm password textfield
                MyTextField(
                  controller: confirmedPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
            
                const SizedBox(height: 10),
            
                const SizedBox(height: 25),
            
                // sign in button
                MyButton(
                  text: "Create account",
                  onTap: signUserUp,
                ),
            
                const SizedBox(height: 50),
            
                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                
            const SizedBox(height: 25),
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        padding: const EdgeInsets.all(10), // Add padding around the text
                        decoration: BoxDecoration(
                          color: Colors.black, // Set background color to black
                          borderRadius: BorderRadius.circular(8), // Optional: Add border radius
                        ),
                        child: const Text(
                          'Login with Existing Account',
                          style: TextStyle(
                            color: Colors.white, // Set text color to white
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
