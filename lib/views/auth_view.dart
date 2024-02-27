import 'package:flutter/material.dart';
import 'package:mvvm_api_authentication/viewmodels/auth_view_model.dart';
import 'package:provider/provider.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final authViewModel = Provider.of<AuthViewModel>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              // obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // final viewModel = Provider.of<AuthViewModel>(context, listen: false);
                authViewModel.loginUser(emailController.text, passwordController.text);
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            Text('Token: ${authViewModel.token}'),
          ],
        ),
      ),
    );
  }
}
