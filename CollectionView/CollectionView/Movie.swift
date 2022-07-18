//
//  Movie.swift
//  CollectionView
//
//  Created by Tringapps on 23/03/22.
//

import Foundation
import UIKit


struct Movie {
    let title: String
    let image: UIImage
}

let movies :[Movie] = [
    Movie(title: "Harry Potter", image: #imageLiteral(resourceName: "HarryPotter.jpeg")), //set an image with #imageLiterals(resourceName: "imagename with .extention")
    Movie(title: "Maari", image: #imageLiteral(resourceName: "Maari.jpeg")),
    Movie(title: "Pattas", image: #imageLiteral(resourceName: "Pattas")),
    Movie(title: "Remo", image: #imageLiteral(resourceName: "Remo.jpeg")),
    Movie(title: "Sulthan", image: #imageLiteral(resourceName: "Sulthan.jpeg")),
    Movie(title: "Viswasam", image: #imageLiteral(resourceName: "Viswasam.jpeg")),
    Movie(title: "DocterStrange", image: #imageLiteral(resourceName: "DoctorStrange")),
    Movie(title: "Spiderman", image: #imageLiteral(resourceName: "Spiderman")),
    Movie(title: "WonderWomen", image: #imageLiteral(resourceName: "WonderWomen")),
    Movie(title: "Jumangi", image: #imageLiteral(resourceName: "Jumanji")),
    Movie(title: "Thor", image: #imageLiteral(resourceName: "Thor")),
    Movie(title: "BlackPanther", image: #imageLiteral(resourceName: "BlackPanther")),
    
]
