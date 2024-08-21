// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ja';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "hello": MessageLookupByLibrary.simpleMessage("こんにちは"),
        "strBadRequestError":
            MessageLookupByLibrary.simpleMessage("不正なリクエストエラー"),
        "strCacheError": MessageLookupByLibrary.simpleMessage("キャッシュエラー"),
        "strConflictError": MessageLookupByLibrary.simpleMessage("競合エラー"),
        "strDefaultError": MessageLookupByLibrary.simpleMessage("デフォルトエラー"),
        "strForbiddenError":
            MessageLookupByLibrary.simpleMessage("アクセスが拒否されました"),
        "strInternalServerError":
            MessageLookupByLibrary.simpleMessage("内部サーバーエラー"),
        "strNoContent": MessageLookupByLibrary.simpleMessage("コンテンツがありません"),
        "strNoInternetError":
            MessageLookupByLibrary.simpleMessage("インターネット接続なし"),
        "strNotFoundError": MessageLookupByLibrary.simpleMessage("見つかりません"),
        "strTimeoutError": MessageLookupByLibrary.simpleMessage("タイムアウトエラー"),
        "strUnauthorizedError": MessageLookupByLibrary.simpleMessage("認証エラー"),
        "strUnknownError": MessageLookupByLibrary.simpleMessage("不明なエラー"),
        "success": MessageLookupByLibrary.simpleMessage("成功"),
        "welcome": MessageLookupByLibrary.simpleMessage("いらっしゃいませ")
      };
}
