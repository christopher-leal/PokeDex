import 'package:vector_math/vector_math.dart' as vect;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/domain/entities/pokemon_list_item.dart';
import 'package:pokedex_app/presentation/pokemons/pokemons_cubit.dart';

class PokemonListScreen extends StatefulWidget {
  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset == _scrollController.position.maxScrollExtent) {
        context.read<PokemonsCubit>().getPokemons();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokemonsCubit, List<PokemonListItem>>(
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
                    child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircularProgressIndicator(),
                ));
              }
              final pokemon = state[index];
              context.read<PokemonsCubit>().getBackgroundColor(pokemon);
              return _PokemonItem(pokemon: pokemon);
            },
          );
        },
      ),
    );
  }
}

class _PokemonItem extends StatelessWidget {
  const _PokemonItem({@required this.pokemon});

  final PokemonListItem pokemon;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 5.0,
      color: pokemon.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '#${pokemon.id.padLeft(3, '0')}',
                    style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.black45, shadows: [
                      const Shadow(blurRadius: 5.0, offset: Offset(0.0, 3.0), color: Colors.black45),
                    ]),
                  ),
                ),
                Text(
                  pokemon.name.toUpperCase(),
                  style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black45, shadows: [
                    const Shadow(blurRadius: 2.0, offset: Offset(0.0, 1.0), color: Colors.black45),
                  ]),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Transform.rotate(
                angle: vect.radians(-45),
                child: Image.asset(
                  'assets/pokeball.png',
                  width: size.width * 0.3,
                  height: size.width * 0.3,
                ),
              ),
              FadeInImage(
                placeholder: const AssetImage('assets/pokeball.png'),
                image: NetworkImage(
                  pokemon.picture,
                ),
                fit: BoxFit.contain,
                width: size.width * 0.3,
                height: size.width * 0.3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
