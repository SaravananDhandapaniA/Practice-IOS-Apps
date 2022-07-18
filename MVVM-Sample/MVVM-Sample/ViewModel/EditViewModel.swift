//
//  EditViewModel.swift
//  MVVM-Sample
//
//  Created by Tringapps on 19/04/22.
//

import Foundation


class EditViewModel{
    
    private var person : EditModel
    
    init(name: String , date:Int , month:Int , year:Int){
        self.person = EditModel.init(name: name, date: date, month: month, year: year)
    }
    
    var name : String{
        let capName = person.name?.capitalized
        return capName!
    }
    
    var age : String{
        
        let DOB = Calendar.current.date(from: DateComponents( year: person.ageOfYear, month: person.ageOfMonth, day: person.ageOfDate))!
        
        let myAge = Calendar.current.dateComponents([.month], from: DOB, to: Date()).month!
        
        let year = myAge / 12
        
        let month = myAge % 12
        
        let currentAge = String("\(year) Years and \(month) Months")
        return currentAge
    }
}
