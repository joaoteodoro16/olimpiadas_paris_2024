// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medal_board_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension MedalBoardStatusMatch on MedalBoardStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == MedalBoardStatus.initial) {
      return initial();
    }

    if (v == MedalBoardStatus.loading) {
      return loading();
    }

    if (v == MedalBoardStatus.loaded) {
      return loaded();
    }

    if (v == MedalBoardStatus.error) {
      return error();
    }

    throw Exception('MedalBoardStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == MedalBoardStatus.initial && initial != null) {
      return initial();
    }

    if (v == MedalBoardStatus.loading && loading != null) {
      return loading();
    }

    if (v == MedalBoardStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == MedalBoardStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
