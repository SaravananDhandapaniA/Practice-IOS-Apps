//
//  Models.swift
//  TodoListCustomCell
//
//  Created by Tringapps on 29/03/22.
//

import Foundation


struct Result:Codable {
    let data : [ResultItem]
}

struct ResultItem :Codable {
    let title :String
    let items : [String]
}
