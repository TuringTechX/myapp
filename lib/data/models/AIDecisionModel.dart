class AIDecisionModel {
  final String decisionId;
  final String recommendation;
  final String decisionContext;
  final DateTime madeAt;

  AIDecisionModel({
    required this.decisionId,
    required this.recommendation,    // Recommended action by AI
    required this.decisionContext,   // Context of decision (e.g., energy efficiency)
    required this.madeAt,
  });
}
