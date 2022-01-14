import 'package:flutter/material.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);

class ListItemsBuilder<T> extends StatelessWidget {
  const ListItemsBuilder({
    Key? key,
    required this.context,
    required this.snapshot,
    required this.itemBuilder,
    required this.scrollController,
    required this.direction,
  }) : super(key: key);

  final BuildContext context;
  final AsyncSnapshot<List<T>> snapshot;
  final ItemWidgetBuilder<T> itemBuilder;
  final ScrollController scrollController;
  final String direction;

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData) {
      final List<T> items = snapshot.data!;
      if (items.isNotEmpty) {
        return _buildList(items);
      } else {
        return Container(color: Colors.white);
      }
    } else if (snapshot.hasError) {
      return Container(color: Colors.red);
    }
    return Container(color: Colors.yellow);
  }

  Widget _buildList(List<T> items) {
    // Using ListView.separated instead of regular ListView makes it more efficient (builder is also like this)
    // builder only builds the items that are visible on screen instead of everything
    // We use more indexes than exist because normally no dividers are placed before and after the list
    return ListView.separated(
      scrollDirection: direction == 'horizontal' ? Axis.horizontal : Axis.vertical,
      controller: scrollController,
      itemCount: items.length,
      // padding: EdgeInsets.only(
      //   top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 24,
      //   bottom: 62 + MediaQuery.of(context).padding.bottom,
      // ),
      separatorBuilder: (context, index) => const Divider(height: 0.5),
      itemBuilder: (context, index) {
        return itemBuilder(context, items[index]);
      },
    );
  }
}
