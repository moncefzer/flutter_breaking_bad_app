import 'package:breaking_bad_app/layout/cubit/app_cubit.dart';
import 'package:breaking_bad_app/layout/cubit/app_state.dart';
import 'package:breaking_bad_app/models/character_model.dart';
import 'package:breaking_bad_app/modules/character_details/character_details_screen.dart';
import 'package:breaking_bad_app/shared/components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  TextEditingController searchContoller = TextEditingController();

  List<CharacterModel> searchedCharacters = [];
  List<CharacterModel> allCharacters = [];

  bool isSearching = false;

  Widget buildSearchingAppBar() => defaultFormField(
      controller: searchContoller,
      type: TextInputType.name,
      hint: 'Find a character ...',
      onChange: searchForCharacter);
  void searchForCharacter(String text) {
    searchedCharacters = allCharacters
        .where((character) => character.name.toLowerCase().startsWith(text))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        allCharacters = AppCubit.get(context).allCharacters;
        return Scaffold(
          appBar: AppBar(
            title:
                isSearching ? buildSearchingAppBar() : const Text('Characters'),
            actions: [
              isSearching
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          searchContoller.clear();
                          isSearching = false;
                        });
                      },
                      icon: const Icon(Icons.close),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isSearching = true;
                        });
                      },
                      icon: const Icon(Icons.search),
                    ),
            ],
            leading: isSearching
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        searchContoller.clear();
                        isSearching = false;
                      });
                    },
                    icon: const Icon(Icons.arrow_back))
                : const SizedBox(),
          ),
          body: ConditionalBuilder(
            condition: allCharacters.isNotEmpty,
            builder: (context) => GridView.builder(
              physics: const BouncingScrollPhysics(),
              cacheExtent: 99999,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 200 / 280,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
              ),
              itemBuilder: (context, index) => buildCharacterItem(
                  isSearching && searchContoller.text.isNotEmpty
                      ? searchedCharacters[index]
                      : allCharacters[index]),
              itemCount: isSearching && searchContoller.text.isNotEmpty
                  ? searchedCharacters.length
                  : allCharacters.length,
            ),
            fallback: (context) => buildLoadingIndicator(),
          ),
        );
      },
    );
  }

  Widget buildCharacterItem(CharacterModel character) => InkWell(
        onTap: () {
          navigatoTo(
              context: context,
              widget: CharacterDetailsScreen(character: character));
        },
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            height: 250,
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: Hero(
              tag: character.charId,
              child: GridTile(
                footer: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  color: Colors.grey.withOpacity(0.6),
                  width: double.infinity,
                  child: Text(
                    character.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                child: FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: 'assets/images/loading.gif',
                  image: character.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );
}
