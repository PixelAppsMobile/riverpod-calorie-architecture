// Mocks generated by Mockito 5.3.2 from annotations
// in totaltest/main.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i2;
import 'package:totaltest/core/result_type.dart' as _i7;
import 'package:totaltest/data/data_sources/local/storage/local_storage_data_source_impl.dart'
    as _i5;
import 'package:totaltest/data/dto/app_user_dto.dart' as _i9;
import 'package:totaltest/data/dto/base_user_dto.dart' as _i10;
import 'package:totaltest/data/dto/food_entry_dto.dart' as _i12;
import 'package:totaltest/data/repositories/authentication/auth_repo_impl.dart'
    as _i8;
import 'package:totaltest/data/repositories/food_consumption/food_consumption_repo_impl.dart'
    as _i11;
import 'package:totaltest/domain/entities/base_user.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSharedPreferences_0 extends _i1.SmartFake
    implements _i2.SharedPreferences {
  _FakeSharedPreferences_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _Fake$BaseUserCopyWith_2<$Res> extends _i1.SmartFake
    implements _i4.$BaseUserCopyWith<$Res> {
  _Fake$BaseUserCopyWith_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LocalStorageDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalStorageDataSourceImpl extends _i1.Mock
    implements _i5.LocalStorageDataSourceImpl {
  MockLocalStorageDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SharedPreferences get preferences => (super.noSuchMethod(
        Invocation.getter(#preferences),
        returnValue: _FakeSharedPreferences_0(
          this,
          Invocation.getter(#preferences),
        ),
      ) as _i2.SharedPreferences);
  @override
  set preferences(_i2.SharedPreferences? _preferences) => super.noSuchMethod(
        Invocation.setter(
          #preferences,
          _preferences,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>> init() =>
      (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>>.value(
            _FakeEither_1<_i7.AppError, _i7.AppSuccess>(
          this,
          Invocation.method(
            #init,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, bool?>> getBool(String? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBool,
          [key],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.AppError, bool?>>.value(
            _FakeEither_1<_i7.AppError, bool?>(
          this,
          Invocation.method(
            #getBool,
            [key],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, bool?>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, bool>> setBool(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setBool,
          [
            key,
            value,
          ],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.AppError, bool>>.value(
            _FakeEither_1<_i7.AppError, bool>(
          this,
          Invocation.method(
            #setBool,
            [
              key,
              value,
            ],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, bool>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, int?>> getInt(String? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #getInt,
          [key],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.AppError, int?>>.value(
            _FakeEither_1<_i7.AppError, int?>(
          this,
          Invocation.method(
            #getInt,
            [key],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, int?>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, bool>> setInt(
    String? key,
    int? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setInt,
          [
            key,
            value,
          ],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.AppError, bool>>.value(
            _FakeEither_1<_i7.AppError, bool>(
          this,
          Invocation.method(
            #setInt,
            [
              key,
              value,
            ],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, bool>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, String?>> getString(String? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #getString,
          [key],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.AppError, String?>>.value(
            _FakeEither_1<_i7.AppError, String?>(
          this,
          Invocation.method(
            #getString,
            [key],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, String?>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, bool>> setString(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setString,
          [
            key,
            value,
          ],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.AppError, bool>>.value(
            _FakeEither_1<_i7.AppError, bool>(
          this,
          Invocation.method(
            #setString,
            [
              key,
              value,
            ],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, bool>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, bool>> clearAll() => (super.noSuchMethod(
        Invocation.method(
          #clearAll,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.AppError, bool>>.value(
            _FakeEither_1<_i7.AppError, bool>(
          this,
          Invocation.method(
            #clearAll,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, bool>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, bool>> setDouble(
    String? key,
    double? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setDouble,
          [
            key,
            value,
          ],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.AppError, bool>>.value(
            _FakeEither_1<_i7.AppError, bool>(
          this,
          Invocation.method(
            #setDouble,
            [
              key,
              value,
            ],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, bool>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, double?>> getDouble(String? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDouble,
          [key],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.AppError, double?>>.value(
            _FakeEither_1<_i7.AppError, double?>(
          this,
          Invocation.method(
            #getDouble,
            [key],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, double?>>);
}

/// A class which mocks [AuthRepoImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepoImpl extends _i1.Mock implements _i8.AuthRepoImpl {
  MockAuthRepoImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i3.Either<_i7.AppError, _i9.AppUserDto?>> getAppUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAppUser,
          [],
        ),
        returnValue:
            _i6.Future<_i3.Either<_i7.AppError, _i9.AppUserDto?>>.value(
                _FakeEither_1<_i7.AppError, _i9.AppUserDto?>(
          this,
          Invocation.method(
            #getAppUser,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, _i9.AppUserDto?>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, _i10.BaseUserDto>> signInUsingCustomToken(
          String? customToken) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInUsingCustomToken,
          [customToken],
        ),
        returnValue:
            _i6.Future<_i3.Either<_i7.AppError, _i10.BaseUserDto>>.value(
                _FakeEither_1<_i7.AppError, _i10.BaseUserDto>(
          this,
          Invocation.method(
            #signInUsingCustomToken,
            [customToken],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, _i10.BaseUserDto>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>> logOut() =>
      (super.noSuchMethod(
        Invocation.method(
          #logOut,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>>.value(
            _FakeEither_1<_i7.AppError, _i7.AppSuccess>(
          this,
          Invocation.method(
            #logOut,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>>);
}

/// A class which mocks [FoodConsumptionRepoImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockFoodConsumptionRepoImpl extends _i1.Mock
    implements _i11.FoodConsumptionRepoImpl {
  MockFoodConsumptionRepoImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get uid => (super.noSuchMethod(
        Invocation.getter(#uid),
        returnValue: '',
      ) as String);
  @override
  _i6.Future<_i3.Either<_i7.AppError, _i12.FoodEntryDto>> addFoodEntry(
    _i12.FoodEntryDto? entry, {
    String? overrideUid,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addFoodEntry,
          [entry],
          {#overrideUid: overrideUid},
        ),
        returnValue:
            _i6.Future<_i3.Either<_i7.AppError, _i12.FoodEntryDto>>.value(
                _FakeEither_1<_i7.AppError, _i12.FoodEntryDto>(
          this,
          Invocation.method(
            #addFoodEntry,
            [entry],
            {#overrideUid: overrideUid},
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, _i12.FoodEntryDto>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, List<_i12.FoodEntryDto>>> getFoodEntries(
          {String? overrideUid}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFoodEntries,
          [],
          {#overrideUid: overrideUid},
        ),
        returnValue:
            _i6.Future<_i3.Either<_i7.AppError, List<_i12.FoodEntryDto>>>.value(
                _FakeEither_1<_i7.AppError, List<_i12.FoodEntryDto>>(
          this,
          Invocation.method(
            #getFoodEntries,
            [],
            {#overrideUid: overrideUid},
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, List<_i12.FoodEntryDto>>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>> updateFoodEntry(
    _i12.FoodEntryDto? entry, {
    String? overrideUid,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateFoodEntry,
          [entry],
          {#overrideUid: overrideUid},
        ),
        returnValue: _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>>.value(
            _FakeEither_1<_i7.AppError, _i7.AppSuccess>(
          this,
          Invocation.method(
            #updateFoodEntry,
            [entry],
            {#overrideUid: overrideUid},
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>> deleteFoodEntry(
    String? documentId, {
    String? overrideUid,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteFoodEntry,
          [documentId],
          {#overrideUid: overrideUid},
        ),
        returnValue: _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>>.value(
            _FakeEither_1<_i7.AppError, _i7.AppSuccess>(
          this,
          Invocation.method(
            #deleteFoodEntry,
            [documentId],
            {#overrideUid: overrideUid},
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>>);
  @override
  _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>> updateCalorieLimit(
    double? calories,
    String? uid,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateCalorieLimit,
          [
            calories,
            uid,
          ],
        ),
        returnValue: _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>>.value(
            _FakeEither_1<_i7.AppError, _i7.AppSuccess>(
          this,
          Invocation.method(
            #updateCalorieLimit,
            [
              calories,
              uid,
            ],
          ),
        )),
      ) as _i6.Future<_i3.Either<_i7.AppError, _i7.AppSuccess>>);
}

/// A class which mocks [BaseUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockBaseUser extends _i1.Mock implements _i4.BaseUser {
  MockBaseUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get uid => (super.noSuchMethod(
        Invocation.getter(#uid),
        returnValue: '',
      ) as String);
  @override
  _i4.$BaseUserCopyWith<_i4.BaseUser> get copyWith => (super.noSuchMethod(
        Invocation.getter(#copyWith),
        returnValue: _Fake$BaseUserCopyWith_2<_i4.BaseUser>(
          this,
          Invocation.getter(#copyWith),
        ),
      ) as _i4.$BaseUserCopyWith<_i4.BaseUser>);
}
