//
//  ViewController.swift
//  ExampleViewTransition
//
//  Created by Tringapps on 21/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnSelect: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnSelect.backgroundColor = .clear
        btnSelect.layer.cornerRadius = 5
        btnSelect.layer.borderWidth = 0.5
        btnSelect.layer.borderColor = UIColor.lightGray.cgColor
        
       
        let cn : String = Shared.shared.companyName ?? "Select Company"
        print("\(cn)")
        
            btnSelect.setTitle(cn, for: .normal)
    
       
    }


}

