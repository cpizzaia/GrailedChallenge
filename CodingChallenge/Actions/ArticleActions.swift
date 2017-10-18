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

func getArticles() {
  mainStore.dispatch(ArticleActions.RequestArticles())
  
  GrailedRequest.shared.getArticles(success: { articles in
    mainStore.dispatch(ArticleActions.ReceiveArticles(data: articles))
  }, failure: { error in
    mainStore.dispatch(ArticleActions.ErrorArticles(error: error))
  })
}
