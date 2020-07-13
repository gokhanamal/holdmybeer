//
//  Weak.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 13.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

class Weak: Equatable {
    
    weak var value: AnyObject?
    
    init(value: AnyObject) {
        self.value = value
    }
    
    static func == (lhs: Weak, rhs: Weak) -> Bool {
        return lhs.value === rhs.value
    }
}
