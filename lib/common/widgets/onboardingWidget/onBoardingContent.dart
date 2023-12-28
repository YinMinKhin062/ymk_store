import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  final String title,subtitle,image;

  const OnBoardingContent({super.key,required this.image,required this.title,required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(24.0),//default space
              child: Column(
                children: [
                  Image(
                    width:MediaQuery.of(context).size.width*.8 ,
                    height:MediaQuery.of(context).size.height*.6 ,
                    image:  AssetImage(image)),
                  
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16,),//spacebetween
                  Text(subtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign:TextAlign.center,
                  )
                 
                ],
              ),
            );
  }
}