// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_country_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension FavoriteCountryStatusMatch on FavoriteCountryStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == FavoriteCountryStatus.initial) {
      return initial();
    }

    if (v == FavoriteCountryStatus.loading) {
      return loading();
    }

    if (v == FavoriteCountryStatus.loaded) {
      return loaded();
    }

    if (v == FavoriteCountryStatus.error) {
      return error();
    }

    throw Exception(
        'FavoriteCountryStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == FavoriteCountryStatus.initial && initial != null) {
      return initial();
    }

    if (v == FavoriteCountryStatus.loading && loading != null) {
      return loading();
    }

    if (v == FavoriteCountryStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == FavoriteCountryStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
