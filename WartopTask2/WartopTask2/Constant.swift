//
//  Constant.swift
//  WartopTask2
//
//  Created by Tringapps on 05/06/22.
//

import Foundation
import UIKit

struct Constant {
    
    static var ISLANDSCAPE: Bool {
        if UIApplication.shared.statusBarOrientation.isLandscape {
            return true
        }
        return false
    }
    
    static var CURRENTSYSTEMVERSION: String {
        return UIDevice.current.systemVersion
    }
}
