class BlockchainModel {
  final String transactionId;
  final String sender;
  final String receiver;
  final double amount; // Cryptocurrency or token amount
  final DateTime transactionDate;
  final String transactionType; // e.g. carbon credit, renewable energy

  BlockchainModel({
    required this.transactionId,
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.transactionDate,
    required this.transactionType,
  });
}
