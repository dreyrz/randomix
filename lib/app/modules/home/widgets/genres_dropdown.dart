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
    return DropdownButton(
      value: value,
      items: widget.genres
          .map(
            (genre) => DropdownMenuItem(
              value: genre,
              child: Text(
                genre.replaceRange(0, 1, genre.substring(0, 1).toUpperCase()),
                style: Theme.of(context).textTheme.headline3,
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
    );
  }
}
