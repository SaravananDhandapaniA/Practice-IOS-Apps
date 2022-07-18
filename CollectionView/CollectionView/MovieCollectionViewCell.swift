//
//  MovieCollectionViewCell.swift
//  CollectionView
//
//  Created by Tringapps on 23/03/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(with movie:Movie){
        movieImageView.image = movie.image
        titleLabel.text = movie.title
    }
}
