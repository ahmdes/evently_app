import 'package:evently_project/presentation/components/build_text_fields.dart';
import 'package:evently_project/presentation/models/text_field_dm.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/constant_manager.dart';
import '../../../components/event.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,),
            child: BuildTextFields(
              textFieldDM: TextFieldDM(
                prefixIcon: Icon(Icons.search),
                suffixIcon: null,
                hintText: "Search for Event",
                obsecureText: false, heightOfTextField: null,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Event(eventDM: ConstantManager.favoriteEvents[index]);
              },
              itemCount: ConstantManager.favoriteEvents.length,
            ),
          ),
        ],
      ),
    );
  }
}
