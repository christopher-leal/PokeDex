import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/pokemon_list_item.dart';
import 'home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen._();

  static Widget init() {
    return BlocProvider(
      create: (context) => HomeCubit(context.read())..init(),
      child: const HomeScreen._(),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset == _scrollController.position.maxScrollExtent) {
        context.read<HomeCubit>().init();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pokedex'),
        ),
        body: BlocBuilder<HomeCubit, List<PokemonListItem>>(
          builder: (context, state) {
            if (state.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: state.length + 1,
              itemBuilder: (context, index) {
                if (index >= state.length) {
                  return const Center(
                      child: CupertinoActivityIndicator(
                    radius: 20,
                  ));
                }
                final pokemon = state[index];
                // context.read<HomeCubit>().getBackgroundColor(index, NetworkImage(pokemon.picture));
                return _PokemonItem(pokemon: pokemon);
              },
            );
          },
        ));
  }
}

class _PokemonItem extends StatelessWidget {
  const _PokemonItem({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

  final PokemonListItem pokemon;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Card(
          color: pokemon.backgroundColor,
          child: Image.asset(
            'assets/pokeball.png',
          ),
        ),
        Center(
          child: Image.network(
            pokemon.picture,
            fit: BoxFit.contain,
            width: size.width * 0.5,
            height: size.width * 0.5,
          ),
        ),
      ],
    );
  }
}
