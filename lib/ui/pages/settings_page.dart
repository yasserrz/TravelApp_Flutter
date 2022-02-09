import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bwa_projects1/cubit/auth_cubit.dart';
import 'package:flutter_bwa_projects1/cubit/page_cubit.dart';
import 'package:flutter_bwa_projects1/shared/theme.dart';
import 'package:flutter_bwa_projects1/ui/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        } else if (state is AuthInitial) {
          context.read<PageCubit>().setPage(0);
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
            child: CustomButton(
          title: 'LogOut',
          onPressed: () {
            context.read<AuthCubit>().signOut();
          },
          width: 220,
        ));
      },
    );
  }
}
