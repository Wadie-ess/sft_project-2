///Created by zakria khan at 19/06/2021///
///email contact@zakriakhan.com///
///fiver link :  https://www.fiverr.com/users/toptutorial270///

class SecurityQuestionModel {
  static final SecurityQuestionModel _SecurityQuestionModel = SecurityQuestionModel._internal();

  factory SecurityQuestionModel() {
    return _SecurityQuestionModel;
  }

  SecurityQuestionModel._internal();
  int questionID;
  String question;

  List<QuestionData> questions = [];

  fromJson(Map<String, dynamic> json) {
    List questionsFromJson = json['data'];
    questions = questionsFromJson.map((ques) {
      return QuestionData()
        ..questionId = ques['id']
        ..question = ques['questions'];
    }).toList();
  }
}

class QuestionData {
  int questionId;
  String question;
}

// [
// {
// "id": 11,
// "questions": "What was your childhood nickname?"
// },
// {
// "id": 12,
// "questions": "What is the name of your favorite childhood friend?"
// },
// {
// "id": 13,
// "questions": "What is the middle name of your youngest child?"
// },
// {
// "id": 14,
// "questions": "What school did you attend for sixth grade?"
// },
// {
// "id": 15,
// "questions": "What was the name of your first stuffed animal?"
// },
// {
// "id": 16,
// "questions": "In what city or town did your mother and father meet?"
// },
// {
// "id": 17,
// "questions": "In what city or town was your first job?"
// },
// {
// "id": 18,
// "questions": "What was your favorite sport in high school?"
// },
// {
// "id": 19,
// "questions": "In what year was your mother born?"
// },
// {
// "id": 20,
// "questions": "In what year was your father born?"
// }
// ]
