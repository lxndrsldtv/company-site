import 'package:flutter/material.dart';

import '../models/text_block_model.dart';
import '../widgests/header_and_body.dart';

/// This function groups [HeaderAndBody] widgets by rows
/// used to create column of rows (i.e. table) at [Services] and [About]
/// [useuseEmptyBlocks] controls will the end of last row filled with
/// empty blocks ([SizedBox]) or not.
/// [lastBlockPadding] allows to manage the width of last text block
/// by assigning the [width] to empty blocks
Widget getRowsOfTextBlocks({
  required List<TextBlockModel> blocks,
  int blocksPerRow = 1,
  bool useEmptyBlocks = true,
  EdgeInsets lastBlockPadding = EdgeInsets.zero,
}) {
  assert(blocksPerRow > 0);
  List<Widget> rows = [];
  for (var i = 0; i < blocks.length; i += blocksPerRow) {
    List<Widget> blocksForRow = [];
    for (var j = 0; j < blocksPerRow; j++) {
      if (i + j < blocks.length) {
        blocksForRow.add(Expanded(
            child: HeaderAndBody(
          header: blocks[i + j].header,
          body: blocks[i + j].body,
        )));
      } else if (useEmptyBlocks) {
        blocksForRow.add(
          lastBlockPadding == EdgeInsets.zero
              ? const Expanded(child: SizedBox(width: 1))
              : SizedBox(width: lastBlockPadding.right / (blocksPerRow - j)),
        );
      }
    }
    rows.add(Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: blocksForRow,
    ));
  }
  return Column(
    children: [...rows],
  );
}
