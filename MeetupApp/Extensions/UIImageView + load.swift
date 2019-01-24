//
//  UIImageView + load.swift
//  MeetupApp
//
//  Created by Gabriel Mazzei on 24/01/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func load(from url: URL) {
        // Create a session
        let session = URLSession(configuration: .default)
        
        let downloadTask = session.dataTask(with: url) { (data, response, error) in
            
            // Check for errors
            if let error = error {
                print("Error downloading picture: \(error)")
                
            } else if let _ = response as? HTTPURLResponse, let data = data {
                
                // If the response class is ok and the data is not nil,
                // then update the imageview on the main thread
                
                DispatchQueue.main.async { [unowned self] in
                    self.image = UIImage(data: data)
                }
            }
        }
        
        // Start the async task
        downloadTask.resume()
    }

}
