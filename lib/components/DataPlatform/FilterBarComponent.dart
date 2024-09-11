import 'package:flutter/material.dart';

class FilterBarComponent extends StatelessWidget {
  final List<String> filters;
  final Function(String) onFilterSelected;

  FilterBarComponent({required this.filters, required this.onFilterSelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FilterChip(
              label: Text(filter),
              onSelected: (isSelected) {
                if (isSelected) {
                  onFilterSelected(filter);
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
