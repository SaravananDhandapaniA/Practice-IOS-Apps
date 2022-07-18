//
//  DataStore.swift
//  CoreTodoList
//
//  Created by Tringapps on 03/04/22.
//

import Foundation
import CoreData


class DataStore: NSObject {
    
    let persistence = PersistanceService.shared
    
    private override init() {
        super.init()
    }
    
    static let shared = DataStore()
    
    func request<T: NSManagedObject>(_ type:T.Type) {
        
    }
    
}
