import 'package:flutter/material.dart';

enum BlockState {
  disabled,
  on,
  off,
}

@immutable
class Block {
  const Block({
    required this.columnIndex,
    required this.rowIndex,
    this.state = BlockState.off,
    this.colorDisabled,
    this.colorOff,
    this.colorOn,
  });

  final int columnIndex;
  final int rowIndex;
  final BlockState state;
  final Color? colorDisabled;
  final Color? colorOff;
  final Color? colorOn;

  Color getColor(BuildContext context) => state == BlockState.disabled
      ? (colorDisabled ?? Colors.transparent)
      : state == BlockState.off
          ? (colorOff ?? Theme.of(context).colorScheme.secondaryContainer)
          : (colorOn ?? Theme.of(context).colorScheme.primary);

  factory Block.fromBlock(Block block) {
    return Block(
      columnIndex: block.columnIndex,
      rowIndex: block.rowIndex,
      state: block.state,
      colorDisabled: block.colorDisabled,
      colorOff: block.colorOff,
      colorOn: block.colorOn,
    );
  }

  Block copyWith({
    int? columnIndex,
    int? rowIndex,
    BlockState? state,
    Color? colorDisabled,
    Color? colorOff,
    Color? colorOn,
  }) {
    return Block(
      columnIndex: columnIndex ?? this.columnIndex,
      rowIndex: rowIndex ?? this.rowIndex,
      state: state ?? this.state,
      colorDisabled: colorDisabled ?? this.colorDisabled,
      colorOff: colorOff ?? this.colorOff,
      colorOn: colorOn ?? this.colorOn,
    );
  }

  static bool isBlock(Object other) {
    return other is Block;
  }

  bool isCoordinateMatch({
    required int rowIndex,
    required int columnIndex,
  }) {
    return this.rowIndex == rowIndex && this.columnIndex == columnIndex;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    var o = other as Block;
    return columnIndex == o.columnIndex &&
        rowIndex == o.rowIndex &&
        state == o.state &&
        colorDisabled == colorDisabled &&
        colorOff == colorOff &&
        colorOn == colorOn;
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        columnIndex,
        rowIndex,
        state,
        colorDisabled,
        colorOff,
        colorOn,
      );

  @override
  String toString() {
    return "$runtimeType(columnIndex: $columnIndex, rowIndex: $rowIndex, state: $state)";
  }

  String toStringFull() {
    var base = toString();
    return base.replaceRange(
      base.length - 1,
      null,
      ", colorDisabled: $colorDisabled, colorOff: $colorOff, colorOn: $colorOn)",
    );
  }
}

@immutable
class EmptyBlock extends Block {
  const EmptyBlock({
    required super.columnIndex,
    required super.rowIndex,
  }) : super(state: BlockState.on);

  static bool isSEmptyBlock(Object other) {
    return other is EmptyBlock;
  }
}

@immutable
class ShapeBlock extends Block {
  const ShapeBlock({
    required super.columnIndex,
    required super.rowIndex,
  }) : super(state: BlockState.on);

  static bool isShapeBlock(Object other) {
    return other is ShapeBlock;
  }
}
