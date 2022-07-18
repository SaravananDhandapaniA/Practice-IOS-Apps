//
//  LocalStorage.swift
//  LoginSignup
//
//  Created by Tringapps on 13/03/22.
//

import Foundation
import SwiftUI

class LocalStorage{
    
    private static let email: String = "email"
    private static let password: String = "password"
    private static let firstname: String = "firstname"
    private static let lastname: String = "lastname"
    private static let status : String = "status"
    
    public static var myEmail : String {
        set{
            UserDefaults.standard.set(newValue,forKey: email)
        }
        get{
            return UserDefaults.standard.string(forKey: email) ?? ""
        }
    }
    
    public static var myPassword : String {
        set{
            UserDefaults.standard.set(newValue,forKey: password)
        }
        get{
            return UserDefaults.standard.string(forKey: password) ?? ""
        }
    }
    
    public static var myFirstname : String {
        set{
            UserDefaults.standard.set(newValue,forKey: firstname)
        }
        get{
            return UserDefaults.standard.string(forKey: firstname) ?? ""
        }
    }
    
    public static var myLastname : String {
        set{
            UserDefaults.standard.set(newValue,forKey: lastname)
        }
        get{
            return UserDefaults.standard.string(forKey: lastname) ?? ""
        }
    }
    
    public static var myStatus : String {
        set{
            UserDefaults.standard.set(newValue,forKey: status)
        }
        get{
            return UserDefaults.standard.string(forKey: status) ?? ""
        }
    }
//    public static func removeValue(){
//
//        UserDefaults.standard.removeObject(forKey: myKey1)
//        UserDefaults.standard.removeObject(forKey: myKey2)
//    }
}

class ColorPallet{
    var ourColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)
}

