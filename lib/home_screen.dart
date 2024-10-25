import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/bloc/auth_bloc.dart';
import 'package:my_bloc/login_screen.dart';
import 'package:my_bloc/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  final String uid;
  const HomeScreen({super.key,required this.uid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthInitial) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: Column(
                children: [
                  Center(
                    child: Text(uid),
                  ),
                  GradientButton(onPressed: () {
                    context.read<AuthBloc>().add(AuthLogoutRequested());
                  })
                ],
              ),
            );
          },
        ));
  }
}
