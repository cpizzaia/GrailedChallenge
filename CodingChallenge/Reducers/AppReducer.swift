//
//  AppReducer.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation
import ReSwift

struct AppState: StateType {
  var articles: ArticlesState
  var merchandise: MerchandiseState
}

func appReducer(action: Action, state: AppState?) -> AppState {
  return AppState(
    articles: articlesReducer(state: state?.articles, action: action),
    merchandise: merchandiseReducer(state: state?.merchandise, action: action)
  )
}
