//
//  ConvertDates.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/18/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation

class ConvertDates {
  // MARK: Private Static Properties
  private static let inputDateFormatter = DateFormatter()
  private static let outputDateFormatter = DateFormatter()
  
  // MARK: Public Static Methods
  static func formatDate(string: String) -> String {
    
    inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    
    guard let date = inputDateFormatter.date(from: string) else { return "could not parse date" }
    
    outputDateFormatter.dateFormat = "dd-MM-yyyy"
    
    return outputDateFormatter.string(from: date)
  }
}
