class InvestmentModel {
  final String investmentId;
  final String investor;
  final double amount;
  final String project;
  final DateTime investedOn;
  final double expectedROI;

  InvestmentModel({
    required this.investmentId,
    required this.investor,
    required this.amount,
    required this.project, // Project invested in
    required this.investedOn,
    required this.expectedROI, // Return on investment
  });
}
