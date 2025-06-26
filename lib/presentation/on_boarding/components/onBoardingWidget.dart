import 'package:flutter/material.dart';
import '../models/on_boarding_dm.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key,required this.onBoardingDM});
  final OnBoardingDM onBoardingDM;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                onBoardingDM.image,
              ),
            ),
            Text(
              onBoardingDM.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              onBoardingDM.subject,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      ),
    );
  }
}
