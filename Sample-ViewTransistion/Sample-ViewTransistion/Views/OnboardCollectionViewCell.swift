//
//  OnboardCollectionViewCell.swift
//  Sample-ViewTransistion
//
//  Created by Tringapps on 20/04/22.
//

import UIKit

class OnboardCollectionViewCell: UICollectionViewCell {
    
//    static let identifier = String(describing: OnboardCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: OnboardModel)
    {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
