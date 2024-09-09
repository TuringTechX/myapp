class BlockchainModel {
  String _lastTransaction = '';

  String get lastTransaction => _lastTransaction;

  Future<void> addTransaction(String transactionDetails) async {
    // Simulate adding a transaction to blockchain
    _lastTransaction = 'Transaction added: $transactionDetails';
    // In real case, connect to blockchain network and add transaction
  }
}
