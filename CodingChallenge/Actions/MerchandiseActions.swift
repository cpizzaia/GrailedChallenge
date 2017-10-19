//
//  MerchandiseActions.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/18/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation
import ReSwift

struct MerchandiseActions {
  struct RequestMerchandise: Action {}
  struct ReceiveMerchandise: Action {
    let items: [Merchandise]
  }
  struct ErrorMerchandise: Action {
    let error: APIRequest.APIError
  }
}

func getMerchandise() {
  mainStore.dispatch(MerchandiseActions.RequestMerchandise())
  
  GrailedRequest.shared.getMerchandise(success: { merchandise in
    mainStore.dispatch(MerchandiseActions.ReceiveMerchandise(items: merchandise))
  }, failure: { error in
    mainStore.dispatch(MerchandiseActions.ErrorMerchandise(error: error))
  })
}
