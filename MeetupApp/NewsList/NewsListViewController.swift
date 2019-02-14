//
//  NewsListViewController.swift
//  MeetupApp
//
//  Created by Gabriel Mazzei on 24/01/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import WolmoCore

class NewsListViewController: UIViewController {
    
    private let newsListView: NewsListView = NewsListView.loadFromNib()!
    private let viewModel: NewsListViewModel
    
    init(viewModel: NewsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = newsListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        viewModel.fetchNews(controller: self)
    }
    
    func setupTable() {
        let tableView = newsListView.tableView
        tableView?.dataSource = self
        tableView?.delegate = self
        newsListView.tableView.register(UINib(nibName: NewsCell.identifier, bundle: nil), forCellReuseIdentifier: NewsCell.identifier)
    }
    
    func loadNews() {
        newsListView.tableView.reloadData()
    }
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.news?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell
        let news = viewModel.news![indexPath.item]
        cell.title.text = news.title
        
        do{
            let url = URL(string: news.picture)
            try cell.picture.image = UIImage(data: Data(contentsOf: url!))
        } catch {
            print(error)
            return cell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = viewModel.news![indexPath.item]
        let viewController = NewsDetailViewController(viewModel: news)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
