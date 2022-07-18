//
//  SecondViewController.swift
//  delegatePractice
//
//  Created by Tringapps on 10/05/22.
//

import UIKit

class SecondViewController: UIViewController {

    
    var selectedData =  ""
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: selectedData)
    }
    

}
