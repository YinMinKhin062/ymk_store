import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ymk_store/common/widgets/homeWidget/appbar.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: const Icon(Iconsax.add,color: Colors.white,),
      ),
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          "Addresses",
          // style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
