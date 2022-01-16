import 'dart:developer';
import 'dart:io';

 main() {
  final rootDir = Directory.current;
  final commitFile = File("${rootDir.path}/.git/COMMIT_EDITMSG");
  final commitMessage = commitFile.readAsStringSync();

  final regExp = RegExp(
    r'(fix|feat|wip|none|chore|refactor|docs|style|test)\:.+',
  );

  final valid = regExp.hasMatch(commitMessage);
  if (!valid) {
    log('''👎 Bad commit message! A correct one would be: 
        docs: correct spelling of CHANGELOG''');
    exitCode = 1;
  } else {
    log('''👍 Nice commit message dude! 👍👍👍''');
  }
}
