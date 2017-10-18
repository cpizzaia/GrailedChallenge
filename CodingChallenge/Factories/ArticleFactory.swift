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
    return Article()
  }
  
  static func createArticles(fromJSONarray jsonArray: [JSON]) -> [Article] {
    return jsonArray.map { json in
      createArticle(fromJSON: json)
    }
  }
}
