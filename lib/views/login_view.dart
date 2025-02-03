import 'package:api_task/viewmodels/login_viewmodel.dart';
import 'package:api_task/views/user_details_view.dart';
import 'package:api_task/widgets/custom_loading.dart';
import 'package:api_task/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.08,
                ),
                const Text(
                  'Log in',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.19,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.06, bottom: height * 0.007),
                      child: const Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                // Email Field
                CustomTextField(
                  hintText: 'Enter your email',
                  obscure: false,
                  controller: _emailController,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.06,
                          top: height * 0.01,
                          bottom: height * 0.007),
                      child: const Text(
                        'Password',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                // Password Field
                CustomTextField(
                  hintText: 'Enter your password',
                  obscure: true,
                  controller: _passwordController,
                ),
                SizedBox(
                  height: height * 0.1,
                ),

                // Login Button
                SizedBox(
                  width: width * 0.5,
                  height: height * 0.06,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await loginViewModel.login(
                            _emailController.text, _passwordController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetailsView(),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Center(
                          child: Text(
                            "Login failed, please check your credentials",
                            style: TextStyle(color: Colors.red),
                          ),
                        )));
                      }

                      _emailController.clear();
                      _passwordController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      shadowColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                if (loginViewModel.isLoading)
                  CustomLoading(
                    loadingText: "Login in",
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
