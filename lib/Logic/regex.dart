class LibRegex {
  bool rRegexMatchOp(String variable, String rule) {
    bool answer;
    var regexRule = r'';
    switch (rule) {
      case "num20":
        regexRule = r'^[0-9]{1,20}$';
        break;
      case "names":
        regexRule = r'^[a-zA-z0-9]{1,20}$';
        break;
      default:
        regexRule = r'[.]*';
    }
    RegExp regExp = RegExp(
      regexRule,
      caseSensitive: false,
      multiLine: false,
    );

    answer = regExp.hasMatch(variable);
    return answer;
  }
}
