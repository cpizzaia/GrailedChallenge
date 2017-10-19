//
//  ViewController.swift
//  CodingChallenge
//
//  Created by Cody Pizzaia on 10/17/17.
//  Copyright © 2017 Cody Pizzaia. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController, StoreSubscriber {
  typealias StoreSubscriberStateType = AppState
  
  @IBOutlet var articlesTableView: UITableView!
  @IBOutlet var merchandiseTableView: UITableView!
  
  //MARK: Public Properties
  var articles = [Article]()
  var nextPage: String?
  var merchandise = [Merchandise]()
  var isFetchingArticles = false
  
  
  // MARK: Public Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    merchandiseTableView.showsVerticalScrollIndicator = false
    articlesTableView.showsVerticalScrollIndicator = false
    
    articlesTableView.register(
      UINib(nibName: "BrowsableTableViewCell", bundle: nil),
      forCellReuseIdentifier: "browsableCell"
    )
    
    merchandiseTableView.register(
      UINib(nibName: "BrowsableTableViewCell", bundle: nil),
      forCellReuseIdentifier: "browsableCell"
    )
    
    
    getArticles()
    getMerchandise()
    
    articlesTableView.dataSource = self
    articlesTableView.delegate = self
    
    merchandiseTableView.dataSource = self
    merchandiseTableView.delegate = self
  }
  
  func newState(state: ViewController.StoreSubscriberStateType) {
    articles = state.articles.items.reduce([], { articles, articleData in
      return articles + articleData.articles
    })
    
    merchandise = state.merchandise.items
    
    isFetchingArticles = state.articles.requesting
    
    nextPage = state.articles.items.last?.paginationData.next
    
    articlesTableView.reloadData()
    merchandiseTableView.reloadData()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    mainStore.subscribe(self)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    mainStore.unsubscribe(self)
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    switch tableView {
    case articlesTableView:
      return articles.count
    case merchandiseTableView:
      return merchandise.count
    default:
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = articlesTableView.dequeueReusableCell(withIdentifier: "browsableCell") as! BrowsableTableViewCell
    
    switch tableView {
    case merchandiseTableView:
      cell.setupCellFor(browsableItem: merchandise[indexPath.row])
    case articlesTableView:
      cell.setupCellFor(browsableItem: articles[indexPath.row])
    default:
      break
    }
    
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 350
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    guard let nextPage = nextPage, scrollView == articlesTableView else { return }
    
    let scrollViewHeight = scrollView.frame.size.height
    let scrollContentSizeHeight = scrollView.contentSize.height
    let scrollOffset = scrollView.contentOffset.y
    
    if scrollOffset + scrollViewHeight >= scrollContentSizeHeight && !isFetchingArticles {
      getArticles(endpointForPage: nextPage)
    }
  }
  
}

