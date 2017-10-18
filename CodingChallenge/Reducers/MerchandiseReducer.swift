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
}

fileprivate func initialMerchandiseState() -> MerchandiseState {
  return MerchandiseState(items: [])
}

func merchandiseReducer(state: MerchandiseState?, action: Action) -> MerchandiseState {
  let state = state ?? initialMerchandiseState()
  
  return state
}
