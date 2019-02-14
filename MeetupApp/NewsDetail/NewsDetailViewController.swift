//
//  NewsDetailViewController.swift
//  MeetupApp
//
//  Created by Nicolas Manograsso on 14/02/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class NewsDetailViewController: UIViewController {
    
    private let viewModel: News
    private let newsDetailView: NewsDetailView = NewsDetailView.loadFromNib()!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    init(viewModel: News) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = newsDetailView
    }
    
    func setupUI() {
        newsDetailView.text.text = viewModel.text
        do{
            let url = URL(string: viewModel.picture)
            try newsDetailView.picture.image = UIImage(data: Data(contentsOf: url!))
        } catch {
            print(error)
            return
        }
    }
}
