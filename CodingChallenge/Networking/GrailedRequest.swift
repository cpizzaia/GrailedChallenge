//
//  GrailedRequest.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation
import Alamofire

class GrailedRequest {
  // MARK: Public Static Properties
  static let shared = GrailedRequest()
  
  // MARK: Public Methods
  func getArticles(success: (ArticleData) -> (), failure: @escaping APIRequest.ErrorCompletion) {
    request.get(
      url: completeURL(fromEndpoint: "articles/ios_index"),
      headers: defaultHeaders,
      success: { json in },
      failure: failure
    )
  }
  
  func getMerchandise(success: ([Merchandise]) -> (), failure: APIRequest.ErrorCompletion) {
    
  }
  
  // MARK: Private Properties
  private let request: APIRequest
  private let baseURL = "https://www.grailed.com/api/"
  private let defaultHeaders: HTTPHeaders? = nil
  
  // MARK: Private Methods
  private init(request: APIRequest = APIRequest.shared) {
    self.request = request
  }
  
  private func completeURL(fromEndpoint endpoint: String) -> String {
    return baseURL + endpoint
  }
}
