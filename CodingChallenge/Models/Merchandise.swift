//
//  Merchandise.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation

struct Merchandise {
  struct Search {
    typealias Filters = (strata: [String], designers: [Int])
    
    let uuid: String
    let indexName: String
    let defaultName: String?
    let query: String
    let filters: Filters
  }
  
  let id: Int
  let name: String
  let imageURL: String
  let itemType: String
  let published: Bool
  let publishedAt: String
  let article: Int?
  let search: Search
}

extension Merchandise: BrowsableItem {
  var image: String {
    get {
      return "https://cdn.fs.grailed.com/AJdAgnqCST4iPtnUxiGtTz/rotate=deg:exif/rotate=deg:0/resize=width:\(300),fit:crop/output=format:jpg,compress:true,quality:95/\(imageURL)"
    }
  }
  
  var title: String {
    get {
      return name
    }
  }
  
  var datePublished: String {
    get {
      return "Published on \(publishedAt)"
    }
  }
  
  
}
