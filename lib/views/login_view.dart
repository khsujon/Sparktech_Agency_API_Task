import 'package:api_task/viewmodels/login_viewmodel.dart';
import 'package:api_task/views/user_details_view.dart';
import 'package:api_task/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email')),
            TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true),
            ElevatedButton(
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
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: Text('Login'),
            ),
            if (loginViewModel.isLoading)
              CustomLoading(
                loadingText: "Login in",
              ),
          ],
        ),
      ),
    );
  }
}
