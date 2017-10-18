//
//  GrailedRequest.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation

class GrailedRequest {
  // MARK: Public Static Properties
  static let shared = GrailedRequest()
  
  // MARK: Public Methods
  
  
  // MARK: Private Properties
  private let request: APIRequest
  private let baseURL = ""
  
  // MARK: Private Methods
  private init(request: APIRequest = APIRequest.shared) {
    self.request = request
  }
  
}
