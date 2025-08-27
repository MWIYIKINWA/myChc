// // To parse this JSON data, do
// //
// //     final sermonVideoList = sermonVideoListFromJson(jsonString);

// import 'dart:convert';

// SermonVideoList sermonVideoListFromJson(String str) =>
//     SermonVideoList.fromJson(json.decode(str));

// String sermonVideoListToJson(SermonVideoList data) =>
//     json.encode(data.toJson());

// class SermonVideoList {
//   String kind;
//   String etag;
//   String nextPageToken;
//   List<VideoItem> VideoItems;
//   PageInfo pageInfo;

//   SermonVideoList({
//     required this.kind,
//     required this.etag,
//     required this.nextPageToken,
//     required this.VideoItems,
//     required this.pageInfo,
//   });

//   factory SermonVideoList.fromJson(Map<String, dynamic> json) =>
//       SermonVideoList(
//         kind: json["kind"],
//         etag: json["etag"],
//         nextPageToken: json["nextPageToken"],
//         VideoItems: List<VideoItem>.from(
//           json["VideoItems"].map((x) => VideoItem.fromJson(x)),
//         ),
//         pageInfo: PageInfo.fromJson(json["pageInfo"]),
//       );

//   Map<String, dynamic> toJson() => {
//     "kind": kind,
//     "etag": etag,
//     "nextPageToken": nextPageToken,
//     "VideoItems": List<dynamic>.from(VideoItems.map((x) => x.toJson())),
//     "pageInfo": pageInfo.toJson(),
//   };
// }

// class VideoItem {
//   String kind;
//   String etag;
//   String id;
//   VideoSnippet videoSnippet;

//   VideoItem({
//     required this.kind,
//     required this.etag,
//     required this.id,
//     required this.videoSnippet,
//   });

//   factory VideoItem.fromJson(Map<String, dynamic> json) => VideoItem(
//     kind: json["kind"],
//     etag: json["etag"],
//     id: json["id"],
//     videoSnippet: VideoSnippet.fromJson(json["VideoSnippet"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "kind": kind,
//     "etag": etag,
//     "id": id,
//     "VideoSnippet": videoSnippet.toJson(),
//   };
// }

// class VideoSnippet {
//   DateTime publishedAt;
//   String channelId;
//   String title;
//   String description;
//   Thumbnails thumbnails;
//   String channelTitle;
//   String playlistId;
//   int position;
//   ResourceId resourceId;
//   String videoOwnerChannelTitle;
//   String videoOwnerChannelId;

//   VideoSnippet({
//     required this.publishedAt,
//     required this.channelId,
//     required this.title,
//     required this.description,
//     required this.thumbnails,
//     required this.channelTitle,
//     required this.playlistId,
//     required this.position,
//     required this.resourceId,
//     required this.videoOwnerChannelTitle,
//     required this.videoOwnerChannelId,
//   });

//   factory VideoSnippet.fromJson(Map<String, dynamic> json) => VideoSnippet(
//     publishedAt: DateTime.parse(json["publishedAt"]),
//     channelId: json["channelId"],
//     title: json["title"],
//     description: json["description"],
//     thumbnails: Thumbnails.fromJson(json["thumbnails"]),
//     channelTitle: json["channelTitle"],
//     playlistId: json["playlistId"],
//     position: json["position"],
//     resourceId: ResourceId.fromJson(json["resourceId"]),
//     videoOwnerChannelTitle: json["videoOwnerChannelTitle"],
//     videoOwnerChannelId: json["videoOwnerChannelId"],
//   );

//   Map<String, dynamic> toJson() => {
//     "publishedAt": publishedAt.toIso8601String(),
//     "channelId": channelId,
//     "title": title,
//     "description": description,
//     "thumbnails": thumbnails.toJson(),
//     "channelTitle": channelTitle,
//     "playlistId": playlistId,
//     "position": position,
//     "resourceId": resourceId.toJson(),
//     "videoOwnerChannelTitle": videoOwnerChannelTitle,
//     "videoOwnerChannelId": videoOwnerChannelId,
//   };
// }

// class ResourceId {
//   String kind;
//   String videoId;

//   ResourceId({required this.kind, required this.videoId});

//   factory ResourceId.fromJson(Map<String, dynamic> json) =>
//       ResourceId(kind: json["kind"], videoId: json["videoId"]);

//   Map<String, dynamic> toJson() => {"kind": kind, "videoId": videoId};
// }

// class Thumbnails {
//   Default thumbnailsDefault;
//   Default medium;
//   Default high;
//   Default standard;
//   Default maxres;

//   Thumbnails({
//     required this.thumbnailsDefault,
//     required this.medium,
//     required this.high,
//     required this.standard,
//     required this.maxres,
//   });

//   factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
//     thumbnailsDefault: Default.fromJson(json["default"]),
//     medium: Default.fromJson(json["medium"]),
//     high: Default.fromJson(json["high"]),
//     standard: Default.fromJson(json["standard"]),
//     maxres: Default.fromJson(json["maxres"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "default": thumbnailsDefault.toJson(),
//     "medium": medium.toJson(),
//     "high": high.toJson(),
//     "standard": standard.toJson(),
//     "maxres": maxres.toJson(),
//   };
// }

// class Default {
//   String url;
//   int width;
//   int height;

//   Default({required this.url, required this.width, required this.height});

//   factory Default.fromJson(Map<String, dynamic> json) =>
//       Default(url: json["url"], width: json["width"], height: json["height"]);

//   Map<String, dynamic> toJson() => {
//     "url": url,
//     "width": width,
//     "height": height,
//   };
// }

// class PageInfo {
//   int totalResults;
//   int resultsPerPage;

//   PageInfo({required this.totalResults, required this.resultsPerPage});

//   factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
//     totalResults: json["totalResults"],
//     resultsPerPage: json["resultsPerPage"],
//   );

//   Map<String, dynamic> toJson() => {
//     "totalResults": totalResults,
//     "resultsPerPage": resultsPerPage,
//   };
// }

import 'dart:convert';

SermonVideoList sermonVideoListFromJson(String str) =>
    SermonVideoList.fromJson(json.decode(str));

String sermonVideoListToJson(SermonVideoList data) =>
    json.encode(data.toJson());

class SermonVideoList {
  String kind;
  String etag;
  String? nextPageToken;
  List<Item> items;
  PageInfo pageInfo;

  SermonVideoList({
    required this.kind,
    required this.etag,
    this.nextPageToken,
    required this.items,
    required this.pageInfo,
  });

  factory SermonVideoList.fromJson(Map<String, dynamic> json) =>
      SermonVideoList(
        kind: json["kind"] ?? '',
        etag: json["etag"] ?? '',
        nextPageToken: json["nextPageToken"],
        items: List<Item>.from(
          (json["items"] ?? []).map((x) => Item.fromJson(x)),
        ),
        pageInfo: PageInfo.fromJson(json["pageInfo"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "nextPageToken": nextPageToken,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "pageInfo": pageInfo.toJson(),
  };
}

class Item {
  String kind;
  String etag;
  String id;
  Snippet snippet;

  Item({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: json["kind"] ?? '',
    etag: json["etag"] ?? '',
    id: json["id"] ?? '',
    snippet: Snippet.fromJson(json["snippet"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "id": id,
    "snippet": snippet.toJson(),
  };
}

class Snippet {
  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  String playlistId;
  int position;
  ResourceId resourceId;
  String videoOwnerChannelTitle;
  String videoOwnerChannelId;

  Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.playlistId,
    required this.position,
    required this.resourceId,
    required this.videoOwnerChannelTitle,
    required this.videoOwnerChannelId,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    publishedAt: json["publishedAt"] != null
        ? DateTime.parse(json["publishedAt"])
        : DateTime.now(),
    channelId: json["channelId"] ?? '',
    title: json["title"] ?? '',
    description: json["description"] ?? '',
    thumbnails: Thumbnails.fromJson(json["thumbnails"] ?? {}),
    channelTitle: json["channelTitle"] ?? '',
    playlistId: json["playlistId"] ?? '',
    position: json["position"] ?? 0,
    resourceId: ResourceId.fromJson(json["resourceId"] ?? {}),
    videoOwnerChannelTitle: json["videoOwnerChannelTitle"] ?? '',
    videoOwnerChannelId: json["videoOwnerChannelId"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "publishedAt": publishedAt.toIso8601String(),
    "channelId": channelId,
    "title": title,
    "description": description,
    "thumbnails": thumbnails.toJson(),
    "channelTitle": channelTitle,
    "playlistId": playlistId,
    "position": position,
    "resourceId": resourceId.toJson(),
    "videoOwnerChannelTitle": videoOwnerChannelTitle,
    "videoOwnerChannelId": videoOwnerChannelId,
  };
}

class ResourceId {
  String kind;
  String videoId;

  ResourceId({required this.kind, required this.videoId});

  factory ResourceId.fromJson(Map<String, dynamic> json) =>
      ResourceId(kind: json["kind"] ?? '', videoId: json["videoId"] ?? '');

  Map<String, dynamic> toJson() => {"kind": kind, "videoId": videoId};
}

class Thumbnails {
  Default? defaultThumbnail;
  Default? medium;
  Default? high;
  Default? standard;
  Default? maxres;

  Thumbnails({
    this.defaultThumbnail,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    defaultThumbnail: json["default"] == null
        ? null
        : Default.fromJson(json["default"]),
    medium: json["medium"] == null ? null : Default.fromJson(json["medium"]),
    high: json["high"] == null ? null : Default.fromJson(json["high"]),
    standard: json["standard"] == null
        ? null
        : Default.fromJson(json["standard"]),
    maxres: json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
  );

  Map<String, dynamic> toJson() => {
    "default": defaultThumbnail?.toJson(),
    "medium": medium?.toJson(),
    "high": high?.toJson(),
    "standard": standard?.toJson(),
    "maxres": maxres?.toJson(),
  };
}

class Default {
  String url;
  int width;
  int height;

  Default({required this.url, required this.width, required this.height});

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    url: json["url"] ?? '',
    width: json["width"] ?? 0,
    height: json["height"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}

class PageInfo {
  int totalResults;
  int resultsPerPage;

  PageInfo({required this.totalResults, required this.resultsPerPage});

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    totalResults: json["totalResults"] ?? 0,
    resultsPerPage: json["resultsPerPage"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "totalResults": totalResults,
    "resultsPerPage": resultsPerPage,
  };
}
