//
//  ArticlesReducer.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation
import ReSwift

struct ArticlesState {
  var items: [Article]
}

fileprivate func initialArticlesState() -> ArticlesState {
  return ArticlesState(items: [])
}

func articlesReducer(state: ArticlesState?, action: Action) -> ArticlesState {
  let state = state ?? initialArticlesState()
  
  
  return state
}


