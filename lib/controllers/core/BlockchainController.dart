import 'package:flutter/material.dart';
import '../../models/BlockchainModel.dart';

class BlockchainController with ChangeNotifier {
  BlockchainModel _blockchainModel = BlockchainModel();

  String get lastTransaction => _blockchainModel.lastTransaction;

  Future<void> recordTransaction(String transactionDetails) async {
    await _blockchainModel.addTransaction(transactionDetails);
    notifyListeners();
  }
}
