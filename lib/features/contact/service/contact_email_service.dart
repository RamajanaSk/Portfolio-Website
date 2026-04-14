import 'package:url_launcher/url_launcher.dart';

class ContactEmailService {
  static Future<void> sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'ramajana1205@aol.com',
      query: Uri.encodeFull(
        'subject=Contact from $name&body=Email: $email\n\n$message',
      ),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw Exception('Could not launch email client');
    }
  }
}
