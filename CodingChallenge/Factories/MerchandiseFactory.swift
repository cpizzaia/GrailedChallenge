//
//  MerchandiseFactory.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation
import SwiftyJSON

class MerchandiseFactory {
  // MARK: Public Static Methods
  static func createMerchandise(fromJSON json: JSON) -> Merchandise {
    return Merchandise()
  }
  
  static func createMerchandise(fromJSONarray jsonArray: [JSON]) -> [Merchandise] {
    return jsonArray.map { json in
      createMerchandise(fromJSON: json)
    }
  }
}
