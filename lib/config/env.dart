import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static final amadeusApiKey = dotenv.get("AMADEUS_API_KEY");
}
