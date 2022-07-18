//
//  CircleCollectionViewCell.swift
//  delegatePractice
//
//  Created by Tringapps on 10/05/22.
//

import UIKit

protocol  imageTapDelegate {
    func didSelectedItem()
}


class CircleCollectionViewCell: UICollectionViewCell {

    var selectedDelegate : imageTapDelegate?
    
    @IBOutlet weak var imageView: UIImageView!
    
     func configure(with name : String)
    {
      //  selectedDelegate?.didSelectedItem()
        imageView.image = UIImage(named: name)
    }
    
//    private let myImageView : UIImageView = {
//         let imageView = UIImageView()
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
//
//        imageView.layer.masksToBounds = true
//        imageView.layer.cornerRadius = 150.0/2.0
//        //imageView.backgroundColor = .blue
//
//        return imageView
//    }()
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        //backgroundColor = .red
//        contentView.addSubview(myImageView)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        myImageView.frame = contentView.bounds
//    }
//
//    public func configure(with name : String){
//        myImageView.image = UIImage(named: name)
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        myImageView.image = nil
//    }
}
