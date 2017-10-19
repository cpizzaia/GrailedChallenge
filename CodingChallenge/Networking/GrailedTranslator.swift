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
  static func translateArticles(response: @escaping (ArticleData?) -> ()) -> APIRequest.DataCompletion  {
    return { data in
      guard let jsonArray = data["data"].array else { return response(nil) }
  
      let articles = ArticleFactory.createArticles(fromJSONarray: jsonArray)
  
      let articleData = ArticleData(
        articles: articles,
        paginationData: translatePaginationData(response: data)
      )
      
      return response(articleData)
    }
  }
  
  static func translateMerchandise(response: @escaping ([Merchandise]) -> ()) -> APIRequest.DataCompletion {
    return { data in
      guard let jsonArray = data["data"].array else {
        response([])
        return
      }
      
      response(MerchandiseFactory.createMerchandise(fromJSONarray: jsonArray))
    }
  }
  
  // MARK: Private Static Methods
  private static func translatePaginationData(response: JSON) -> PaginationData {
    let paginationData = response["metadata"]["pagination"]
    
    return PaginationData(
      next: paginationData["next_page"].string ?? "",
      current: paginationData["current_page"].string ?? "",
      prev: paginationData["previous_page"].string ?? ""
    )
  }
}
