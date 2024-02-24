
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){context.read<LoginBloc>().add(RequestEmailLogin('mahamudul.dev@gmail.com', '123456'));}, child: const Text('Request Login')),
      ),
    );
  }
}
