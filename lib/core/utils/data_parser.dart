class DataParser {
  static String formatServerTime(String serverTime) {
    final dateTime = DateTime.parse(serverTime);
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} second ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 2) {
      return 'Yesterday';
    } else if (difference.inDays < 3) {
      return 'Day before yesterday';
    } else {
      return '${difference.inDays} days ago';
    }
  }
}
