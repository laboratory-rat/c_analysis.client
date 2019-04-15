import 'package:intl/intl.dart';

final dateFormatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.'Z'");
DateTime timeFromJson(String date) => dateFormatter.parse(date);
String timeToJson(DateTime date) => dateFormatter.format(date);