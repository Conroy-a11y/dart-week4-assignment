import 'dart:io';

void main() async {
  print('=== Dart Utility App ===');
  stdout.write('Enter a word or sentence: ');
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print('No input provided. Exiting...');
    return;
  }

  // --- STRING MANIPULATION ---
  String upper = input.toUpperCase();
  String lower = input.toLowerCase();
  String reversed = input.split('').reversed.join();
  String concatenated = '$input 🔥 Dart is awesome!';

  print('\n--- String Manipulation ---');
  print('Uppercase: $upper');
  print('Lowercase: $lower');
  print('Reversed: $reversed');
  print('Concatenated: $concatenated');

  // --- COLLECTIONS ---
  List<String> stringList = [input, upper, lower, reversed];
  Set<String> uniqueWords = input.split(' ').toSet();
  Map<String, dynamic> dataMap = {
    'original': input,
    'upper': upper,
    'lower': lower,
    'reversed': reversed,
    'timestamp': DateTime.now().toString(),
  };

  print('\n--- Collections ---');
  print('List: $stringList');
  print('Unique words (Set): $uniqueWords');
  print('Data Map: $dataMap');

  // --- DATE AND TIME ---
  DateTime now = DateTime.now();
  DateTime earlier = now.subtract(Duration(days: 7));
  Duration difference = now.difference(earlier);

  print('\n--- Date & Time ---');
  print('Current time: $now');
  print('One week ago: $earlier');
  print('Difference in days: ${difference.inDays} days');

  // --- FILE HANDLING ---
  final file = File('results.txt');
  final logEntry = '''
====================
Input: $input
Uppercase: $upper
Lowercase: $lower
Reversed: $reversed
Concatenated: $concatenated
Timestamp: $now
====================
''';

  // Write to file
  await file.writeAsString(logEntry, mode: FileMode.append);
  print('\nData written to results.txt ✅');

  // Read from file
  print('\n--- Reading File Contents ---');
  String contents = await file.readAsString();
  print(contents);
}
