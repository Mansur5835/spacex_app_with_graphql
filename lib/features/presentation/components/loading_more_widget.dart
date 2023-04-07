import 'package:flutter/material.dart';
import 'package:spacex_grathql_app/core/extansions/duration.dart';

typedef CallbackFunc<bool> = Future<void> Function();

// ignore: must_be_immutable
class LoadMoreWidget extends StatefulWidget {
  List<Widget> items;
  final ScrollController? parentScrollController;
  final CallbackFunc? loadMore;
  final String? notFountItemsText;

  LoadMoreWidget(
      {super.key,
      this.parentScrollController,
      required this.items,
      this.loadMore,
      this.notFountItemsText});

  @override
  State<LoadMoreWidget> createState() => _LoadMoreWidgetState();
}

class _LoadMoreWidgetState extends State<LoadMoreWidget> {
  bool isLoading = false;
  bool permissionToCall = true;

  @override
  void initState() {
    super.initState();

    // ignore: invalid_use_of_protected_member
    if (!(widget.parentScrollController?.hasListeners ?? false)) {
      widget.parentScrollController?.addListener(_listener);
    }
  }

  _listener() {
    if (permissionToCall == false) {
      return;
    }
    // ignore: non_constant_identifier_names
    double? MAX_SCROLL_OFFSET =
        widget.parentScrollController?.position.maxScrollExtent;

    // ignore: non_constant_identifier_names
    double? CURRENT_SCROLL_OFFSET = widget.parentScrollController?.offset;

    if (MAX_SCROLL_OFFSET == null || CURRENT_SCROLL_OFFSET == null) {
      return;
    }

    if (((MAX_SCROLL_OFFSET - CURRENT_SCROLL_OFFSET).abs() < 100) && mounted) {
      permissionToCall = false;
      isLoading = true;
      loadData();

      if (mounted) {
        setState(() {});
      }
    }
  }

  loadData() async {
    await widget.loadMore!.call();

    isLoading = false;
    Future.delayed(100.onDur, () {
      permissionToCall = true;
    });

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: List.generate(widget.items.length, (index) {
        return widget.items[index];
      })
        ..add(isLoading
            ? Container(
                height: 80,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: theme.primaryColor,
                ),
              )
            : Container()),
    );
  }
}
