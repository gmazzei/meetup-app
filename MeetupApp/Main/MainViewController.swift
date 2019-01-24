//
//  ViewController.swift
//  MeetupApp
//
//  Created by Gabriel Mazzei on 24/01/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class MainViewController: UIViewController {

    private let mainView: MainView = MainView.loadFromNib()!
    private let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    private func setupViewController() {
        mainView.image.addTapGestureRecognizer { [unowned self] recognizer in
            self.mainView.title.text = "New title"
            self.mainView.message.text = "New message"
            self.mainView.image.load(from: "https://bit.ly/2CE3Msd")
        }
        
        mainView.nextLabel.addTapGestureRecognizer { [unowned self] recognizer in
            let controller = NewsListViewController(viewModel: NewsListViewModel())
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

