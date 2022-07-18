//
//  SecondViewController.swift
//  ExampleViewTransition
//
//  Created by Tringapps on 21/04/22.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: "Mango1")
        let imageView = UIImageView(image: image)
        
        self.view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraints([
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
        ])
    }
    

}
