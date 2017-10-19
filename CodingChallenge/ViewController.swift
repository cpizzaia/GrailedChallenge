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
  
  //MARK: Public Properties
  var articles = [Article]()
  var nextPage: String?
  
  
  // MARK: Public Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    articlesTableView.register(
      UINib(nibName: "BrowsableTableViewCell", bundle: nil),
      forCellReuseIdentifier: "browsableCell"
    )
    
    getArticles()
    
    articlesTableView.dataSource = self
    articlesTableView.delegate = self
  }
  
  func newState(state: ViewController.StoreSubscriberStateType) {
    articles = state.articles.items.reduce([], { articles, articleData in
      return articles + articleData.articles
    })
    
    nextPage = state.articles.items.last?.paginationData.next
    
    articlesTableView.reloadData()
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
    return articles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = articlesTableView.dequeueReusableCell(withIdentifier: "browsableCell") as! BrowsableTableViewCell
    
    cell.setupCellFor(browsableItem: articles[indexPath.row])
    
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 350
  }
}

