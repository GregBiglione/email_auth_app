extension Regex on RegExp {
  static RegExp get password => RegExp(
      r'^(?=.*?[A-ZẞÀÁÄÂÆÃÅĀBÇĒÊÉÈËFGHÌÏÍÎĪJKLMÑÕŌŒØÒÖÓÔŪÜÚÛÙ])(?=.*?[a-zÞßþàáäӑāâåấąæćčçďđéèëēêęệğħìíïīîľłn̈ňñóöōŏôœởøřšșťùúüŭūûýÿž])(?=.*?[0-9])(?=.*?[\)\(\[\]+±?§/*~_,.:;“”%π|"≤×@#´&<>’{^ç¢«}»©°÷!$£¤µ–=€`≥-]).{8,}$'
  );

  static RegExp get lowercase => RegExp(r'[a-zÞßþàáäӑāâåấąæćčçďđéèëēêęệğħìíïīîľłn̈ňñóöōŏôœởøřšșťùúüŭūûýÿž]');

  static RegExp get uppercase => RegExp(r'[A-ZẞÀÁÄÂÆÃÅĀBÇĒÊÉÈËFGHÌÏÍÎĪJKLMÑÕŌŒØÒÖÓÔŪÜÚÛÙ]');

  static RegExp get number => RegExp(r'[0-9]');

  static RegExp get specialCharacter => RegExp(r'[\)\(\[\]+±?§/*~_,.:;“”%π|"≤×@#´&<>’{^ç¢«}»©°÷!$£¤µ–=€`≥-]');

  static RegExp get blankCharacter => RegExp(r' ');
}