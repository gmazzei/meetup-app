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
    }
    
}
