import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p/layout/NewsApp/Cubit/Cubit.dart';
import 'package:p/layout/NewsApp/Cubit/States.dart';
import 'package:p/shared/shared.compoennts/components.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsState>(
      listener:  (context,state){},
      builder:  (context,state)
    {
    var list = NewsCubit.get(context).search;
    return Scaffold(
    appBar: AppBar(),
    body: Column(
    children:
    [
    Padding(
    padding: const EdgeInsets.all(20.0),
    child: defaultFormField(
    controller: searchController,
    type: TextInputType.text,
    onChange: (value)
    {
    NewsCubit.get(context).getSearch(value);
    },
    validate: (String value)
    {
    if(value.isEmpty)
    {
    return'search must not be empty';
    }
    return null;
    },
    label: 'Search',
    prefix: Icons.search,
    ),
    ),
    Expanded(child: atricleBuilder(list, context, isSearch: true,)),
    ],
    ),
    );
      },
    );
  }
}
