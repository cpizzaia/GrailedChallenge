//
//  MerchandiseReducer.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation
import ReSwift

struct MerchandiseState {
  var items: [Merchandise]
  var requesting: Bool
}

fileprivate func initialMerchandiseState() -> MerchandiseState {
  return MerchandiseState(items: [], requesting: false)
}

func merchandiseReducer(state: MerchandiseState?, action: Action) -> MerchandiseState {
  var state = state ?? initialMerchandiseState()
  
  switch action {
  case _ as ReSwiftInit:
    break
  case _ as MerchandiseActions.RequestMerchandise:
    state.requesting = true
  case let action as MerchandiseActions.ReceiveMerchandise:
    state.items = action.items
    state.requesting = false
  case _ as MerchandiseActions.ErrorMerchandise:
    state.requesting = false
  default:
    break
  }
  
  return state
}
