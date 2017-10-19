//
//  ArticleFactory.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation
import SwiftyJSON

class ArticleFactory {
  // MARK: Public Static Methods
  static func createArticle(fromJSON json: JSON) -> Article {
    return Article(
      id: json["id"].int ?? 0,
      url: json["url"].string ?? "",
      title: json["title"].string ?? "",
      publishedAt: json["published_at"].int ?? 0,
      published: json["published"].bool ?? false,
      hero: json["hero"].string ?? "",
      listings: json["listings"].array?.flatMap({ $0.string }) ?? [],
      tagsList: json["tag_list"].array?.flatMap({ $0.string }) ?? [],
      franchise: json["franchise"].string ?? "",
      slug: json["slug"].string ?? "",
      author: json["author"].string ?? "",
      contentType: json["content_type"].string ?? "",
      position: json["position"].string ?? ""
    )
  }
  
  static func createArticles(fromJSONarray jsonArray: [JSON]) -> [Article] {
    return jsonArray.map { json in
      createArticle(fromJSON: json)
    }
  }
}
