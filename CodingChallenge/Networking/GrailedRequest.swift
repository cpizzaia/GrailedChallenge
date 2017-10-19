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
  func getArticles(endpointForPage: String, success: @escaping (ArticleData?) -> (), failure: @escaping APIRequest.ErrorCompletion) {
    request.get(
      url: completeURL(fromEndpoint: endpointForPage),
      headers: defaultHeaders,
      success: GrailedTranslator.translateArticles(response: success),
      failure: failure
    )
  }
  
  func getMerchandise(success: @escaping ([Merchandise]) -> (), failure: @escaping APIRequest.ErrorCompletion) {
    request.get(
      url: completeURL(fromEndpoint: "/api/merchandise/marquee"),
      headers: defaultHeaders,
      success: GrailedTranslator.translateMerchandise(response: success),
      failure: failure
    )
  }
  
  // MARK: Private Properties
  private let request: APIRequest
  private let baseURL = "https://www.grailed.com"
  private let defaultHeaders: HTTPHeaders? = nil
  
  // MARK: Private Methods
  private init(request: APIRequest = APIRequest.shared) {
    self.request = request
  }
  
  private func completeURL(fromEndpoint endpoint: String) -> String {
    return baseURL + endpoint
  }
}
