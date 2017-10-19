//
//  Browsable.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/18/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation

protocol BrowsableItem {
  var image: String { get }
  var title: String { get }
  var datePublished: String { get }
}
