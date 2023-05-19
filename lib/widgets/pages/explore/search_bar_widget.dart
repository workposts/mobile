import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../configuration.dart';

class SearchBarWidget extends StatefulWidget {
  final Function() toggleSearch;
  const SearchBarWidget({super.key, required this.toggleSearch});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final FocusNode _focus = FocusNode();
  final TextEditingController _controller = TextEditingController();
  var currentSearch = '';
  @override
  void initState() {
    _focus.addListener(_onFocusChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        width: _focus.hasFocus
            ? MediaQuery.of(context).size.width * 0.9
            : MediaQuery.of(context).size.width * 0.70,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_focus.hasFocus ? 0 : 24),
          child: TextField(
            controller: _controller,
            focusNode: _focus,
            cursorColor: Configuration.primaryLightColor,
            style: const TextStyle(
                color: Configuration.primaryLightColor,
                fontSize: 14,
                fontFamily: 'Bold'),
            textInputAction: TextInputAction.search,
            textAlign: TextAlign.start,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              prefixIconConstraints:
                  const BoxConstraints.expand(width: 60, height: 20),
              prefixIcon: SizedBox(
                child: SvgPicture.asset("images/magnifying-glass.svg",
                    color: Configuration.primaryLightColor,
                    width: 20,
                    height: 20),
              ),
              suffixIconConstraints:
                  const BoxConstraints.expand(width: 60, height: 15),
              suffixIcon: currentSearch.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        _controller.clear();
                        setState(() {
                          currentSearch = '';
                        });
                      },
                      child: SvgPicture.asset("images/close.svg",
                          color: Configuration.accentColor,
                          width: 5,
                          height: 5),
                    )
                  : Container(),
              focusedBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Configuration.accentColor, width: 2)),
              filled: !_focus.hasFocus,
              fillColor: Configuration.secondaryDarkColor,
              hintMaxLines: 1,
              hintText: 'Find Workposts',
              hintStyle: const TextStyle(
                  color: Configuration.quaternaryDarkColor,
                  fontSize: 14,
                  fontFamily: 'Bold'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            ),
            onSubmitted: (String submitted) => {},
            onChanged: (String submitted) {
              setState(() {
                currentSearch = submitted;
              });
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {
      widget.toggleSearch();
    });
  }
}
