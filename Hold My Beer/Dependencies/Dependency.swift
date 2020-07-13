//
//  Dependency.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 13.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

@propertyWrapper
class Dependency<T> {
    var wrappedValue: T
    
    init() {
        self.wrappedValue = DependencyContainer.resolve()
    }
}
