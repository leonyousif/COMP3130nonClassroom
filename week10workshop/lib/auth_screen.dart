import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  // true = login form, false = registration form.
  var _isLogin = true;
  // Used to disable buttons and show a loading spinner during Firebase calls.
  var _isAuthenticating = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  void _toggleMode() {
    setState(() {
      // Switches between the login and register versions of the same screen.
      _isLogin = !_isLogin;
      _repeatPasswordController.clear();
    });
  }

  Future<void> _submit() async {
    // Stop here if any TextFormField validator returns an error message.
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    // The form is valid, so show loading while waiting for Firebase.
    setState(() {
      _isAuthenticating = true;
    });

    try {
      if (_isLogin) {
        // Logs in an existing Firebase Authentication user.
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        // Registers a new Firebase Authentication user.
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
    } on FirebaseAuthException catch (error) {
      if (!mounted) {
        return;
      }

      // Firebase returns helpful errors such as wrong password or email in use.
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'Authentication failed.')),
      );
    } finally {
      if (mounted) {
        // Always remove the spinner after Firebase finishes or throws an error.
        setState(() {
          _isAuthenticating = false;
        });
      }
    }
  }

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';

    if (email.isEmpty || !email.contains('@')) {
      return 'Enter a valid email address.';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    final password = value ?? '';

    if (password.length < 6) {
      return 'Password must be at least 6 characters.';
    }

    return null;
  }

  String? _validateRepeatPassword(String? value) {
    final repeatPassword = value ?? '';

    // Registration asks for the password twice to catch typing mistakes.
    if (repeatPassword != _passwordController.text) {
      return 'Passwords must match.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(_isLogin ? 'Login' : 'Register')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        _isLogin ? 'Welcome back' : 'Create an account',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'Email address',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                        ),
                        validator: _validateEmail,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        textInputAction: _isLogin
                            ? TextInputAction.done
                            : TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                        ),
                        validator: _validatePassword,
                        onFieldSubmitted: (_) {
                          if (_isLogin) {
                            _submit();
                          }
                        },
                      ),
                      if (!_isLogin) ...[
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _repeatPasswordController,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            labelText: 'Repeat password',
                            prefixIcon: Icon(Icons.lock_reset_outlined),
                            border: OutlineInputBorder(),
                          ),
                          validator: _validateRepeatPassword,
                          onFieldSubmitted: (_) {
                            _submit();
                          },
                        ),
                      ],
                      const SizedBox(height: 20),
                      if (_isAuthenticating)
                        const Center(child: CircularProgressIndicator())
                      else
                        ElevatedButton.icon(
                          onPressed: _submit,
                          icon: Icon(
                            _isLogin ? Icons.login : Icons.person_add_alt,
                          ),
                          label: Text(_isLogin ? 'Login' : 'Register'),
                        ),
                      TextButton(
                        onPressed: _isAuthenticating ? null : _toggleMode,
                        child: Text(
                          _isLogin
                              ? 'Need an account? Register'
                              : 'Already have an account? Login',
                          style: TextStyle(color: colorScheme.primary),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
