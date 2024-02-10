class BlockData {
  BlockData({
    required this.columnIndex,
    required this.rowIndex,
  });

  final int columnIndex;
  final int rowIndex;
}

class Block extends BlockData {
  Block({
    required super.columnIndex,
    required super.rowIndex,
    BlockData? data,
  });
}
