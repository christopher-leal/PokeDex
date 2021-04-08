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
