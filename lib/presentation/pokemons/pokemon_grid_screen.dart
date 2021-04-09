import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/domain/entities/pokemon_list_item.dart';
import 'package:pokedex_app/presentation/pokemons/pokemons_cubit.dart';

class PokemonGridScreen extends StatefulWidget {
  @override
  _PokemonGridScreenState createState() => _PokemonGridScreenState();
}

class _PokemonGridScreenState extends State<PokemonGridScreen> {
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
          return GridView.builder(
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: state.length + 1,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index >= state.length) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircularProgressIndicator(),
                ));
              }
              final pokemon = state[index];
              return _PokemonItem(pokemon: pokemon);
            },
          );
        },
      ),
    );
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
