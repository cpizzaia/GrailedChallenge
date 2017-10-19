//
//  ArticleActions.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation
import ReSwift

struct ArticleActions {
  struct RequestArticles: Action {}
  struct ReceiveArticles: Action {
    let data: ArticleData
  }
  struct ErrorArticles: Action {
    let error: APIRequest.APIError
  }
}

func getArticles(endpointForPage: String = "/api/articles/ios_index") {
  mainStore.dispatch(ArticleActions.RequestArticles())
  
  GrailedRequest.shared.getArticles(endpointForPage: endpointForPage, success: { articleData in
    guard let articleData = articleData else { return }
    mainStore.dispatch(ArticleActions.ReceiveArticles(data: articleData))
  }, failure: { error in
    mainStore.dispatch(ArticleActions.ErrorArticles(error: error))
  })
}
