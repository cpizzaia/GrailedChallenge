//
//  ArticleCell.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/18/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class BrowsableTableViewCell: UITableViewCell {
  @IBOutlet var productImageView: UIImageView!
  
  @IBOutlet var title: UILabel!
  @IBOutlet var publishedDate: UILabel!
  
  //MARK: Public Properties
  var item: BrowsableItem?
  
  //MARK: Public Methods
  func setupCellFor(browsableItem: BrowsableItem) {
    item = browsableItem
    title.adjustsFontSizeToFitWidth = true
    title.minimumScaleFactor = 0.2
    title.numberOfLines = 3
    title.text = item?.title
    
    publishedDate.text = item?.datePublished
    
    productImageView.sd_setImage(with: URL(string: browsableItem.image), completed: nil)
  }
  
}
