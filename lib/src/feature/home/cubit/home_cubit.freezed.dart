// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  CurrencyModel get fromCurrency => throw _privateConstructorUsedError;
  CurrencyModel get toCurrency => throw _privateConstructorUsedError;
  String get fromAmount => throw _privateConstructorUsedError;
  String get toAmount => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {CurrencyModel fromCurrency,
      CurrencyModel toCurrency,
      String fromAmount,
      String toAmount,
      bool isLoading,
      String? error});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromCurrency = null,
    Object? toCurrency = null,
    Object? fromAmount = null,
    Object? toAmount = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      fromCurrency: null == fromCurrency
          ? _value.fromCurrency
          : fromCurrency // ignore: cast_nullable_to_non_nullable
              as CurrencyModel,
      toCurrency: null == toCurrency
          ? _value.toCurrency
          : toCurrency // ignore: cast_nullable_to_non_nullable
              as CurrencyModel,
      fromAmount: null == fromAmount
          ? _value.fromAmount
          : fromAmount // ignore: cast_nullable_to_non_nullable
              as String,
      toAmount: null == toAmount
          ? _value.toAmount
          : toAmount // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CurrencyModel fromCurrency,
      CurrencyModel toCurrency,
      String fromAmount,
      String toAmount,
      bool isLoading,
      String? error});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromCurrency = null,
    Object? toCurrency = null,
    Object? fromAmount = null,
    Object? toAmount = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$HomeStateImpl(
      fromCurrency: null == fromCurrency
          ? _value.fromCurrency
          : fromCurrency // ignore: cast_nullable_to_non_nullable
              as CurrencyModel,
      toCurrency: null == toCurrency
          ? _value.toCurrency
          : toCurrency // ignore: cast_nullable_to_non_nullable
              as CurrencyModel,
      fromAmount: null == fromAmount
          ? _value.fromAmount
          : fromAmount // ignore: cast_nullable_to_non_nullable
              as String,
      toAmount: null == toAmount
          ? _value.toAmount
          : toAmount // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {required this.fromCurrency,
      required this.toCurrency,
      this.fromAmount = "",
      this.toAmount = "",
      this.isLoading = false,
      this.error});

  @override
  final CurrencyModel fromCurrency;
  @override
  final CurrencyModel toCurrency;
  @override
  @JsonKey()
  final String fromAmount;
  @override
  @JsonKey()
  final String toAmount;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'HomeState(fromCurrency: $fromCurrency, toCurrency: $toCurrency, fromAmount: $fromAmount, toAmount: $toAmount, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.fromCurrency, fromCurrency) ||
                other.fromCurrency == fromCurrency) &&
            (identical(other.toCurrency, toCurrency) ||
                other.toCurrency == toCurrency) &&
            (identical(other.fromAmount, fromAmount) ||
                other.fromAmount == fromAmount) &&
            (identical(other.toAmount, toAmount) ||
                other.toAmount == toAmount) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fromCurrency, toCurrency,
      fromAmount, toAmount, isLoading, error);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final CurrencyModel fromCurrency,
      required final CurrencyModel toCurrency,
      final String fromAmount,
      final String toAmount,
      final bool isLoading,
      final String? error}) = _$HomeStateImpl;

  @override
  CurrencyModel get fromCurrency;
  @override
  CurrencyModel get toCurrency;
  @override
  String get fromAmount;
  @override
  String get toAmount;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
