// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_event_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension SearchEventStatusMatch on SearchEventStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == SearchEventStatus.initial) {
      return initial();
    }

    if (v == SearchEventStatus.loading) {
      return loading();
    }

    if (v == SearchEventStatus.loaded) {
      return loaded();
    }

    if (v == SearchEventStatus.error) {
      return error();
    }

    throw Exception(
        'SearchEventStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == SearchEventStatus.initial && initial != null) {
      return initial();
    }

    if (v == SearchEventStatus.loading && loading != null) {
      return loading();
    }

    if (v == SearchEventStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == SearchEventStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
