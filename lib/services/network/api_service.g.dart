// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'api_service.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// Post _$PostFromJson(Map<String, dynamic> json) => Post()
//   ..userId = json['userId'] as int
//   ..id = json['id'] as int
//   ..title = json['title'] as String
//   ..body = json['body'] as String;

// Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
//       'userId': instance.userId,
//       'id': instance.id,
//       'title': instance.title,
//       'body': instance.body,
//     };

// // **************************************************************************
// // RetrofitGenerator
// // **************************************************************************

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

// class _ApiService implements ApiService {
//   _ApiService(
//     this._dio, {
//     this.baseUrl,
//   }) {
//     baseUrl ??= 'http://localhost:7070/api';
//   }

//   final Dio _dio;

//   String? baseUrl;

//   @override
//   Future<List<Post>> getPosts() async {
//     const _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final Map<String, dynamic>? _data = null;
//     final _result =
//         await _dio.fetch<List<dynamic>>(_setStreamType<List<Post>>(Options(
//       method: 'GET',
//       headers: _headers,
//       extra: _extra,
//     )
//             .compose(
//               _dio.options,
//               '/posts',
//               queryParameters: queryParameters,
//               data: _data,
//             )
//             .copyWith(
//                 baseUrl: _combineBaseUrls(
//               _dio.options.baseUrl,
//               baseUrl,
//             ))));
//     var value = _result.data!
//         .map((dynamic i) => Post.fromJson(i as Map<String, dynamic>))
//         .toList();
//     return value;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }

//   String _combineBaseUrls(
//     String dioBaseUrl,
//     String? baseUrl,
//   ) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }

//     final url = Uri.parse(baseUrl);

//     if (url.isAbsolute) {
//       return url.toString();
//     }

//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }
