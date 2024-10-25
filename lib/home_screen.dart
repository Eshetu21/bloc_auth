import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state as AuthSucess;
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(authState.uid),
        ));
  }
}
