//
//  EditModel.swift
//  MVVM-Sample
//
//  Created by Tringapps on 19/04/22.
//

import Foundation


class EditModel{
    
    var name:String?
    var ageOfDate:Int?
    var ageOfMonth:Int?
    var ageOfYear:Int?
    
    init(name: String , date:Int , month:Int , year:Int){
        self.name = name
        self.ageOfDate = date
        self.ageOfMonth = month
        self.ageOfYear = year
    }
}
