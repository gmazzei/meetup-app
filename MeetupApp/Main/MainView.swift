//
//  MainView.swift
//  MeetupApp
//
//  Created by Gabriel Mazzei on 24/01/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class MainView: UIView, NibLoadable {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var nextLabel: UILabel!
}
