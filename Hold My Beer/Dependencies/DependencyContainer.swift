//
//  DependencyContainer.swift
//  Hold My Beer
//
//  Created by Gokhan Namal on 13.07.2020.
//  Copyright © 2020 Gokhan Namal. All rights reserved.
//

import Foundation

public class DependencyContainer {
    var dependencies = [String: Weak]()
    private static var shared = DependencyContainer()
    
    public static func register<T>(_ dependency: T) {
        shared.register(dependency)
    }
    
    public static func resolve<T>() -> T {
        return shared.resolve()
    }
    
    private func register<T>(_ dependency: T) {
        let key = "\(type(of: T.self))"
        print(key)
        let weak = Weak(value: dependency as AnyObject)
        dependencies[key] = weak
    }
    
    private func resolve<T>() -> T {
        let key = "\(type(of: T.self))"
        let weak = dependencies[key]
        print("resolve",key)
        precondition(weak != nil, "No dependency found for \(key)")
        
        let dependency = weak!.value
        
        precondition(weak != nil, "Dependency deallocated aldready for \(key)")
        
        return dependency as! T
    }
}
