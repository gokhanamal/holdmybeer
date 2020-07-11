//
//  UIImageView+Ext.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 11.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation
import class UIKit.UIImageView
import class UIKit.UIImage

extension UIImageView {
    func downloadImage(url: URL) {
        let task = URLSession.shared.dataTask(with: url) {[weak self] data,response,_ in
           guard let data = data else {
               return
           }
           
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
        task.resume()
    }
}
