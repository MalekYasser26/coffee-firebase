import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/brewModel.dart';
import 'BrewTile.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of< List <brewModel>?>(context) ?? [] ;
    brews?.forEach((element) {
    print(element.name);
    print(element.sugars);
    print(element.strength);

    });
    return ListView.builder(itemBuilder: (context, index) {
      return BrewTile(brews : brews[index]);
    },
    shrinkWrap: true,
      itemCount: brews!.length,
    );
  }
}
