import 'package:eqlibrum/dto/user_dto.dart';
import 'package:flutter/material.dart';

abstract class UserFacade extends ChangeNotifier {
  // Validate login User.
  Future<bool> loginUser(UserDTO userDTO);

  // Delete idToke
  void logout();

  //get User to work with data
  void getUser();

  //get User Name by given  id
  Future<String> getUserNameById(String id);

  // Create NewUser.
  Future<bool> createUser(UserDTO userDTO);

  /// Get Token
  Future<String> getIdToken();

  /// Update User's account.
  ///
  /// Return [bool] return if account was update succefully.
  Future<bool> updateUser(UserDTO user);

  /// Delete User's account.
  ///
  /// Return [bool] return if account was deleted succefully.
  Future<bool> deleteUser();
  }
