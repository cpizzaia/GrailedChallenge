//
//  Article.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation

struct Article {
  let id: Int
  let url: String
  let title: String
  let publishedAt: Int
  let published: Bool
  let hero: String
  let listings: [String]
  let tagsList: [String]
  let franchise: String
  let slug: String
  let author: String
  let contentType: String
  let position: String
}

extension Article: BrowsableItem {
  var image: String {
    get {
      return "https://cdn.fs.grailed.com/AJdAgnqCST4iPtnUxiGtTz/rotate=deg:exif/rotate=deg:0/resize=width:\(300),fit:crop/output=format:jpg,compress:true,quality:95/\(hero)"
    }
  }
  
  var datePublished: String {
    get {
      
      
      return "Published Today"
    }
  }
}
