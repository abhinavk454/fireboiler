import 'package:fireboiler/services/state_service.dart';
import 'package:fireboiler/utils/constant_utils.dart';
import 'package:fireboiler/widgets/button_one_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<ApplicationState>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  authData.user!.photoURL ?? placeholderLink,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              "Welcome ${authData.user!.displayName}",
              style: const TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10.0),
            ButtonOne(
              text: "Sign Out",
              height: 50.0,
              width: 100.0,
              bgColor: colorThree,
              handleClick: () {
                authData.signOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
