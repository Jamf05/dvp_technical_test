import 'package:dvp_technical_test/core/failures/error.dart';
import 'package:dvp_technical_test/core/failures/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dvp_technical_test/core/database/database_helper.dart';
import 'package:dvp_technical_test/features/data/models/user_model.dart';
import 'package:dvp_technical_test/features/domain/entities/enums/session_status.dart';

abstract class AuthLocalDataSource {
  // Future getAuth();
  // Future login();
  Future<void> signUp(Map<String, dynamic> params);
  // Future logout();
  // Future isAuthenticate();
  // Future getUserId();
  // Future getCurrentUser();

  /// params:
  /// ```json
  /// {
  ///   "id_cognito": (String),
  ///   "email": (String),
  ///   "birthdate": (String),
  ///   "user_name": (String),
  ///   "session_status": (int),
  /// }
  /// ```
  ///
  Future setCurrentUser(Map<String, dynamic> params);
  Future<UserModel?> getCurrentUser();
  Future<SessionStatus?> getSessionStatus();
  Future<void> setSessionStatus({String? id, SessionStatus? status});
  Future<void> clearCurrentUser();
  Future<void> logOut();
  Future<String?> getUserId();
  Future<void> setUserId(String? id);
  Future<String?> getToken();
  Future<void> setToken(String? token);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future signUp(Map<String, dynamic> params) async {
    // TODO: implement signin
    await Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      List<Map> store = await _databaseHelper.selectQuery('user', [], "", []);
      if (store.isNotEmpty) {
        return UserModel.fromQuery(Map.from(store.last));
      }
      return null;
    } on DatabaseException catch (error) {
      throw SqfliteFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  @override
  Future<void> setCurrentUser(Map<String, dynamic> params) async {
    try {
      await _databaseHelper.execute(
        '''
        INSERT OR REPLACE INTO user (id_cognito, user_name, email, birthdate, session_status) 
        VALUES("${params['userSub']}", "${params['userName']}", "${params['email']}", "${params['birthDay']}", "${params['session_status']}");
        ''',
      );
    } on DatabaseException catch (error) {
      throw SqfliteFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  @override
  Future<SessionStatus?> getSessionStatus() async {
    try {
      String? id = await getUserId();
      String where = "id_cognito = \"$id\"";
      final res = await _databaseHelper.selectQuery(
          "user", ['session_status'], where, []);
      if (res != null && res.length > 0) {
        var listProd = List<Map<String, dynamic>>.generate(
            res.length, (index) => Map<String, dynamic>.from(res[index]),
            growable: true);
        return int.tryParse(listProd.first["session_status"])?.toSessionStatus;
      } else {
        return SessionStatus.unknown;
      }
    } on DatabaseException catch (error) {
      throw SqfliteFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  @override
  Future<void> setSessionStatus({String? id, SessionStatus? status}) async {
    try {
      Map<String, dynamic> values = {
        "session_status": status?.value
      };
      String where = "id_cognito = \"$id\"";
      await _databaseHelper.update("user", values, where, []);
    } on DatabaseException catch (error) {
      throw SqfliteFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  @override
  Future<void> clearCurrentUser() async {
    try {
      await _databaseHelper.execute('''DELETE FROM user''');
    } on DatabaseException catch (error) {
      throw SqfliteFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }

  @override
  Future<String?> getUserId() async {
    return sharedPreferences.getString("id_cognito");
  }

  @override
  Future<void> setUserId(String? id) async {
    if(id != null) sharedPreferences.setString('id_cognito', id);
  }

  @override
  Future<String?> getToken() async {
    return sharedPreferences.getString("token");
  }

  @override
  Future<void> setToken(String? token) async {
    if(token != null) sharedPreferences.setString('token', token);
  }

  @override
  Future<void> logOut() async {
    try {
      await clearCurrentUser();
      final id = await getUserId();
      await setSessionStatus(id: id, status: SessionStatus.unknown);
      await setToken("");
      await setUserId("");
    } on DatabaseException catch (error) {
      throw SqfliteFailure.decode(error);
    } on Error catch (error) {
      throw ErrorFailure.decode(error);
    } on Exception catch (error) {
      throw ExceptionFailure.decode(error);
    }
  }
}
