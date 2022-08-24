class QuestionModel {
  String? question;
  Map<String, bool>? answers;
  QuestionModel({
    this.question,
    this.answers,
  });
  static List<QuestionModel> questionData = [
    QuestionModel(
      question: 'What is the name of the first planet in the solar system?',
      answers: {
        'A': false,
        'B': false,
        'C': true,
        'D': false,
      },
    ),
    QuestionModel(
      question: 'What is the name of the second planet in the solar system?',
      answers: {
        'A': false,
        'B': true,
        'C': false,
        'D': false,
      },
    ),
    QuestionModel(
      question: 'What is the name of the third planet in the solar system?',
      answers: {
        'A': false,
        'B': false,
        'C': false,
        'D': true,
      },
    ),
    QuestionModel(
      question: 'What is the name of the fourth planet in the solar system?',
      answers: {
        'A': true,
        'B': false,
        'C': false,
        'D': false,
      },
    ),
    QuestionModel(
      question: 'What is the name of the fifth planet in the solar system?',
      answers: {
        'A': false,
        'B': false,
        'C': false,
        'D': false,
      },
    ),
    QuestionModel(
      question: 'What is the name of the sixth planet in the solar system?',
      answers: {
        'A': false,
        'B': false,
        'C': false,
        'D': false,
      },
    ),
    QuestionModel(
      question: 'What is the name of the seventh planet in the solar system?',
      answers: {
        'A': false,
        'B': false,
        'C': false,
        'D': false,
      },
    ),
    QuestionModel(
      question: 'What is the name of the eighth planet in the solar system?',
      answers: {
        'A': false,
        'B': false,
        'C': false,
        'D': false,
      },
    ),
  ];
}
