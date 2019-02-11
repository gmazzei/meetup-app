//
//  NewsListViewModel.swift
//  MeetupApp
//
//  Created by Gabriel Mazzei on 24/01/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import UIKit

class NewsListViewModel {
    var news: [News]?
    
    func fetchNews(tableView: UITableView) {
        guard let url = URL(string: "https://android-training.herokuapp.com/news") else { return }
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else{
                print("error")
                return
            }
            do {
                let decoder = JSONDecoder()
                self.news = try decoder.decode([News].self, from: data)
                tableView.reloadData()
            } catch {
                print("error after download")
            }
        }.resume()
    }
}
