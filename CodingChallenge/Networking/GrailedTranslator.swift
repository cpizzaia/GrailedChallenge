//
//  GrailedTranslator.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation
import SwiftyJSON

class GrailedTranslator {
  // MARK: Public Static Methods
  static func translateArticles(response: JSON) -> ArticleData? {
    guard let jsonArray = response.array else { return nil }
    
    let articles = ArticleFactory.createArticles(fromJSONarray: jsonArray)
    
    return ArticleData(
      articles: articles,
      paginationData: translatePaginationData(response: response)
    )
  }
  
  static func translateMerchandise(response: JSON) -> [Merchandise] {
    guard let jsonArray = response.array else { return [] }
    return MerchandiseFactory.createMerchandise(fromJSONarray: jsonArray)
  }
  
  // MARK: Private Static Methods
  private static func translatePaginationData(response: JSON) -> PaginationData {
    return PaginationData(next: "", current: "", prev: "")
  }
}
