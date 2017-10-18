//
//  ArticlesReducer.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation
import ReSwift

typealias PaginationData = (next: String, current: String, prev: String)
typealias ArticleData = (articles: [Article], paginationData: PaginationData)

struct ArticlesState {
  var items: [ArticleData]
  var requesting: Bool
}

fileprivate func initialArticlesState() -> ArticlesState {
  return ArticlesState(items: [], requesting: false)
}

func articlesReducer(state: ArticlesState?, action: Action) -> ArticlesState {
  var state = state ?? initialArticlesState()
  
  switch action {
  case _ as ReSwiftInit:
    break
  case _ as ArticleActions.RequestArticles:
    state.requesting = true
  case let action as ArticleActions.ReceiveArticles:
    state.items = state.items + [action.data]
    state.requesting = false
  case _ as ArticleActions.ErrorArticles:
    state.requesting = false
  default:
    break
  }
  
  return state
}


