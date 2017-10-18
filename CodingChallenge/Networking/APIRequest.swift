//
//  APIRequest.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIRequest {
  static let shared = APIRequest()
  
  struct APIError: Error {
    let code: Int
    let domainCode: Int?
    let description: String
  }
  
  struct Response {
    let statusCode: Int
    let headers: Headers
    let body: Body
  }
  
  typealias Headers = JSON
  typealias Body = JSON
  
  struct RequestParams {
    let url: String
    let method: HTTPMethod
    let body: Parameters?
    let headers: HTTPHeaders?
    let success: DataCompletion
    let failure: ErrorCompletion
  }
  
  typealias DataCompletion = (JSON) -> ()
  typealias ErrorCompletion = (APIError) -> ()
  
  //MARK: Public Methods
  func get(url: String, headers: HTTPHeaders?, success: @escaping DataCompletion, failure: @escaping ErrorCompletion) {
    
    request(params: RequestParams(url: url, method: .get, body: nil, headers: headers, success: success, failure: failure))
    
  }
  
  //MARK: Private Methods
  private init() {}
  
  private func request(params: RequestParams) {
    log("\(params.method.rawValue): \(params.url)")
    
    Alamofire.request(
      params.url,
      method: params.method,
      parameters: params.body,
      encoding: JSONEncoding.default,
      headers: params.headers
      ).validate().responseJSON(completionHandler: { response in
        self.handle(response: response, params: params)
      })
  }
  
  
  
  private func handle(response: DataResponse<Any>, params: RequestParams) {
    let apiResponse = Response(
      statusCode: response.response?.statusCode ?? 400,
      headers: JSON(response.response?.allHeaderFields ?? [:]),
      body: JSON(data: response.data ?? Data())
    )
    
    switch response.result {
    case .success:
      log("SUCCESS: \(params.url)")
      params.success(apiResponse.body)
      
    case .failure:
      log("FAILURE: \(params.url)")
      params.failure(self.errorFrom(response: apiResponse))
      }
  }
  
  private func errorFrom(response: Response) -> APIError {
    return APIError(
      code: response.statusCode,
      domainCode: nil,
      description: "Something went wrong, please try again."
    )
  }
}
