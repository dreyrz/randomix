import 'package:flutter/material.dart';

class GenresDropDown extends StatefulWidget {
  final List<String> genres;
  final Function(String genre) onGenreSelected;
  const GenresDropDown(this.genres, this.onGenreSelected, {Key? key})
      : super(key: key);

  @override
  State<GenresDropDown> createState() => _GenresSearchState();
}

class _GenresSearchState extends State<GenresDropDown> {
  late String value;

  @override
  void initState() {
    value = widget.genres.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(6)),
      child: DropdownButton(
        isExpanded: true,
        value: value,
        dropdownColor: Theme.of(context).secondaryHeaderColor,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Theme.of(context).backgroundColor,
        ),
        underline: Container(
          height: 1.0,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        items: widget.genres
            .map(
              (genre) => DropdownMenuItem(
                value: genre,
                child: Text(
                  genre.replaceRange(0, 1, genre.substring(0, 1).toUpperCase()),
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Theme.of(context).backgroundColor),
                ),
              ),
            )
            .toList(),
        onChanged: (String? newValue) {
          setState(() {
            value = newValue!;
            widget.onGenreSelected(newValue);
          });
        },
      ),
    );
  }
}
