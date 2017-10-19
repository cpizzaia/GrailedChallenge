//
//  MerchandiseFactory.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation
import SwiftyJSON

class MerchandiseFactory {
  // MARK: Public Static Methods
  static func createMerchandise(fromJSON json: JSON) -> Merchandise {
    let search = json["search"]
    let filters = json["filters"]
    return Merchandise(
      id: json["id"].int ?? 0,
      name: json["name"].string ?? "",
      imageURL: json["image_url"].string ?? "",
      itemType: json["saved_search"].string ?? "",
      published: json["published"].bool ?? false,
      publishedAt: ConvertDates.formatDate(string: json["published_at"].string ?? ""),
      article: json["article"].int,
      search: Merchandise.Search(
        uuid: search["uuid"].string ?? "",
        indexName: search["index_name"].string ?? "",
        defaultName: search["default_name"].string ?? "",
        query: search["query"].string ?? "",
        filters: Merchandise.Search.Filters(
          strata: filters["strata"].array?.flatMap{ $0.string } ?? [],
          designers: filters["designers"].array?.flatMap{ $0.int } ?? []
        )
      )
    )
  }
  
  static func createMerchandise(fromJSONarray jsonArray: [JSON]) -> [Merchandise] {
    return jsonArray.map { json in
      createMerchandise(fromJSON: json)
    }
  }
}
