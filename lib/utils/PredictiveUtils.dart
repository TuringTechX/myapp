class PredictionUtils {
  static double normalizeScore(double rawScore) {
    return (rawScore / 100) * 5.0; // Normalize score to a scale of 5
  }

  static String interpretScore(double score) {
    if (score >= 4.0) return "Excellent";
    if (score >= 3.0) return "Good";
    return "Needs Improvement";
  }
}
