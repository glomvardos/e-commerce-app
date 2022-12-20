import 'package:e_commerce_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key,
      required this.icon,
      required this.text,
      required this.actionKey})
      : super(key: key);
  final IconData icon;
  final String text;
  final String actionKey;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {
        if (actionKey == 'logout')
          {BlocProvider.of<AuthenticationBloc>(context).add(LogoutUser())}
        else
          {Navigator.of(context).pushNamed(actionKey)}
      },
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
